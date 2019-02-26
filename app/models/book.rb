class Book < ApplicationRecord
	attachment :image
	belongs_to :user

	 validates :body, presence: true
     validates :body, length: { maximum: 200 }
end
