namespace :scrape do
  desc 'Scrape Telanon website for posts'
  task telanon: :environment do
    ScrapeTelanonService.scrape
  end
end
