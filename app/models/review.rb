class Review < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :bookmarks, dependent: :destroy
	attachment :image, destroy: false
	belongs_to :genre

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 500}
	validates :genre_id, presence: true

	def bookmark_by?(user)
		bookmarks.where(user_id: user.id).exists?
	end

	def self.search(search, word)
        if search == "1"
        	@review = Review.where(["title LIKE?","#{word}%"])
        elsif search == "2"
        	@review = Review.where(["title LIKE?","%#{word}"])
        elsif search == "3"
        	@review = Review.where(["title LIKE?","#{word}"])
        elsif search == "4"
        	@review = Review.where(["title LIKE?","%#{word}%"])
        else
        	@review = Review.all
        end
    end
end
