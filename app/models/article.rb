require 'acts-as-taggable-on'

class Article < ActiveRecord::Base
	scope :highest_weight, -> { order('weight DESC')}
	scope :most_recent, -> { where(post_status: 'post').order("created_at DESC")}
	scope :discussed, -> { order('comment_count DESC') }

	belongs_to :user
	has_many :comments
	has_many :votes

	validates :body, :title, presence: true

	# article images
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/fenway.jpg"
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	def user_voted(user)
		unless user
			false
		else
			!self.votes.where(user_id: user.id).empty?
		end 
	end

	def vote_average
		(self.votes.sum(:quality) / self.votes.count) + (self.votes.count * 0.5)
	end

	#find number of comments per article so that articles can be sorted by that number
	before_save :update_comments_count

	def update_comments_count
		self.comment_count = self.comments.count
	end

	def destroy?
		self.votes.count > 10 && self.votes.average(:quality).to_i < 40
	end

	# tagging
  acts_as_taggable
end
