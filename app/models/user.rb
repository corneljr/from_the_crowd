class User < ActiveRecord::Base
	authenticates_with_sorcery!

	has_many :articles
	has_many :comments
	has_many :votes

	validates :password, length: { minimum: 5 }
	validates :password, confirmation: true
	validates :password_confirmation, presence: true

	validates :email, uniqueness: true

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
