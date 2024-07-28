namespace :active_storage do
  desc 'Delete orphaned Active Storage blobs'
  task cleanup: :environment do
    # Find blobs that are not attached to any record
    orphaned_blobs = ActiveStorage::Blob.left_outer_joins(:attachments).where(active_storage_attachments: { id: nil })

    # Delete each orphaned blob
    orphaned_blobs.find_each do |blob|
      blob.purge
      puts 'Deleted blob #{blob.id}'
    end

    puts 'Cleanup completed. Deleted #{orphaned_blobs.count} orphaned blobs.'
  end
end
