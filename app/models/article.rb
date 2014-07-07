require 'acts-as-taggable-on'

class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	validates :body, :title, presence: true

	# article images
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/fenway.jpg"
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	# tagging
  acts_as_taggable
end
