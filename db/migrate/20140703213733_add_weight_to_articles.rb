class AddWeightToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :weight, :float
  end
end
