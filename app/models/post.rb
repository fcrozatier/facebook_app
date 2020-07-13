class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments
  has_one_attached :photo

  validates :body, presence: true

  def optimized_photo(x,y)
    photo.variant(resize_to_limit: [x,y])
  end
end
