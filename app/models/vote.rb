class Vote < ActiveRecord::Base
	belongs_to :article
	belongs_to :user

	after_save :update_weight


	def update_weight
		@score = score(article.votes.count, article.vote_average, article.created_at)
		article.update_columns(weight: @score)
	end

	def epoch_seconds(t)
	  (t.to_i - Time.local(2005, 12, 8, 7, 46, 43).to_i).to_f
	end

	def score(votes, quality, date)
    displacement = Math.log( votes, 10 ).to_f 
    return (displacement * (quality / 100.0)) + ( epoch_seconds(date) / 45000 )
	end 

	def destroy?(article)
		article.votes.count > 10 && article.votes.average(:quality).to_i < 40
	end

end
