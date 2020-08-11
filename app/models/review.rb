class Review < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :bookmarks, dependent: :destroy
	attachment :image, destroy: false
	belongs_to :genre

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 500}

	def bookmark_by?(user)
		bookmarks.where(user_id: user.id).exists?
	end
end
