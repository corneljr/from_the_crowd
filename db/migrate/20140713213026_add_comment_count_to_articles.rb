class AddCommentCountToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :comment_count, :integer
  end
end
