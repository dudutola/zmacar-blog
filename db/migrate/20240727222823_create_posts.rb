class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :external_url
      t.date :published_date, null: false, default: -> { 'CURRENT_DATE' }
      t.string :publisher, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
