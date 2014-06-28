class User < ActiveRecord::Base
	authenticates_with_sorcery!

	has_many :articles
	has_many :comments
	has_many :votes

	validates :password, length: { minimum: 5 }
	validates :password, confirmation: true
	validates :password_confirmation, presence: true

	validates :email, uniqueness: true

	def user_signed_in?
		
	end

end
