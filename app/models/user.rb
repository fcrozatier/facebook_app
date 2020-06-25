class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :birthdate, :gender, presence: true

  has_many :sent_requests, class_name: "FriendRequest", dependent: :destroy, inverse_of: :sender, foreign_key: "sender_id"
  has_many :received_requests, class_name: "FriendRequest", dependent: :destroy, inverse_of: :receiver, foreign_key: "receiver_id"
  
  has_many :notifications

  def new_notifications?
    notifications.where(viewed: false).count > 0
  end

  def new_notifications_count
    notifications.where(viewed: false).count
  end
end
