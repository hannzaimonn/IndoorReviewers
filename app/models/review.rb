class Review < ApplicationRecord
	belongs_to :user
	attachment :image, destroy: false
	belongs_to :genre

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 500}
	validates :genre_id, presence: true
end
