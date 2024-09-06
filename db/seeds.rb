# frozen_string_literal: true

# db/seeds.rb

puts 'Seeding database with articles'

# Create sample articles
Article.find_or_create_by!(title: 'First Article') do |article|
  article.content = 'This is the content of the first article.'
  article.url = 'https://www.telanon.info/sociedade/2024/08/25/45522/adeus-da-trindade-a-professora-edith-salvaterra/'
  article.photo.attach(io: File.open(Rails.root.join('db/fixtures/photos/yes.png')), filename: 'yes.png')
end

Article.find_or_create_by!(title: 'Second Article') do |article|
  article.content = 'This is the content of the second article.'
  article.url = 'https://www.telanon.info/suplemento/opiniao/2024/08/04/45300/suicidio-do-mlstp-partido-social-democrata-nas-mascaras-da-reforma-da-justica/'
  article.photo.attach(io: File.open(Rails.root.join('db/fixtures/photos/yes.png')), filename: 'yes.png')
end

Article.find_or_create_by!(title: 'Third Article') do |article|
  article.content = 'This is the content of the third article.'
  article.url = 'https://www.telanon.info/politica/2024/04/13/43876/sal-de-ulisses-correia-e-silva-no-tempero-da-diplomacia-do-desespero/'
  article.photo.attach(io: File.open(Rails.root.join('db/fixtures/photos/yes.png')), filename: 'yes.png')
end

puts 'Articles seeded successfully.'
