require 'httparty'
require 'nokogiri'
require 'open-uri'
require 'addressable/uri'


class ScrapeTelanonService
  BASE_URL = 'https://www.telanon.info/tag/jose-maria/'.freeze

  def self.scrape
    (1..6).each do |page|
      url = page == 1 ? BASE_URL : "#{BASE_URL}page/#{page}/"
      begin
        response = HTTParty.get(url, timeout: 10) # Set a timeout of 10 seconds
        parse_page(response.body)
      rescue Net::ReadTimeout, OpenSSL::SSL::SSLError, Errno::ECONNREFUSED => e
        Rails.logger.error("Failed to fetch page #{page}: #{e.message}")
        retry # Retry fetching the page
      end
    end
  end

  def self.parse_page(html)
    doc = Nokogiri::HTML(html)
    doc.css('li.infinite-post').each do |post_element|
      title = post_element.at_css('a[rel="bookmark"]').attr('title')
      external_url = post_element.at_css('a[rel="bookmark"]').attr('href')
      content = post_element.at_css('p').text.strip
      published_date = extract_date_from_url(external_url)
      publisher = 'telanon'

      begin
        post = Post.create!(
          title: title,
          external_url: external_url,
          content: content,
          published_date: published_date,
          publisher: publisher
        )
        puts "Created post: #{post.id} | #{post.title}"

        image_url = post_element.at_css('img.reg-img.wp-post-image').attr('src')
        encoded_image_url = Addressable::URI.parse(image_url).normalize.to_s
        image = URI.open(encoded_image_url)
        post.thumbnail.attach(io: image, filename: 'image.jpg')
      rescue ActiveRecord::RecordInvalid => e
        Rails.logger.error("Failed to create post with title '#{title}': #{e.message}")
      end
    end
  end

  def self.extract_date_from_url(url)
    # fetch the url and extract date from time.post-date.updated
    doc = Nokogiri::HTML(URI.open(url))
    date = doc.at_css('time.post-date.updated').attr('datetime')
    Date.parse(date)
  end
end
