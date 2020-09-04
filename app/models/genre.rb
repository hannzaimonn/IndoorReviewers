class Genre < ApplicationRecord
	has_many :reviews
	belongs_to :user

	validates :name, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
end
