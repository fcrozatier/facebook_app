class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  def optimized_photo(x,y)
    photo.variant(resize_to_limit: [x,y])
  end
end
