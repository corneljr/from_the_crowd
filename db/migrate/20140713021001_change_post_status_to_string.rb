class ChangePostStatusToString < ActiveRecord::Migration
  def change
  	change_column :articles, :post_status, :string
  end
end
