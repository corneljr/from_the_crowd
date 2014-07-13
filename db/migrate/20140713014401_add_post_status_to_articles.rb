class AddPostStatusToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :post_status, :boolean
  end
end
