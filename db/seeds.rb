# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ['Action', 'Comedy', 'Drama', 'Horror'].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Seeding database with posts from telanon.info'

# call lib/tasks/cleanup.rake task
Rake::Task['active_storage:cleanup'].invoke

Post.destroy_all
puts 'Deleted all posts'

# clean up the ActiveStorage::Attachment and ActiveStorage::Blob tables
# ActiveStorage::Attachment.destroy_all
# ActiveStorage::Blob.destroy_all
# ActiveStorage::Attachment.all.each { |attachment| attachment.purge }
ActiveStorage::Attachment.all.each(&:purge)
puts 'Deleted all ActiveStorage attachments and blobs'

# Delete files from the storage directory
storage_path = Rails.root.join('storage')
# use FileUtils to remove directories only inside storage path
# FileUtils.rm_rf(Dir.glob("#{storage_path}/*"))
# FileUtils.rm_rf(Dir.glob("#{storage_path}/**/*"))

# Find all directories within the storage_path
directories = Dir.glob("#{storage_path}/*").select { |entry| File.directory?(entry) }

# Remove each directory
FileUtils.rm_rf(directories)

puts 'Starting to scrape telanon.info'
ScrapeTelanonService.scrape
