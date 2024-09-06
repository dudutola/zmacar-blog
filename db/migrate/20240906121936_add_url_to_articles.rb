class AddUrlToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :url, :string
  end
end
