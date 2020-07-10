require 'open-uri' 

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  validates :name, :birthdate, :gender, presence: true

  has_many :notifications, dependent: :destroy
  
  has_many :sent_friendships, class_name: "Friendship", dependent: :destroy, inverse_of: :sender, foreign_key: "sender_id"
  has_many :sent_friends, through: :sent_friendships, source: :receiver
  has_many :received_friendships, class_name: "Friendship", dependent: :destroy, inverse_of: :receiver, foreign_key: "receiver_id"
  has_many :received_friends, through: :received_friendships, source: :sender

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one :profile

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(name: data['name'],
            email: data['email'],
            gender: "Male",
            birthdate: DateTime.now,
            password: Devise.friendly_token[0,20]
        )
      user.create_profile
      user.profile.photo.attach(io: open(data['image']), filename:"photo.jpg")
    end
    user
  end

  def friends_ids
    (sent_friendships.where(status: "friend").pluck(:receiver_id) + received_friendships.where(status: "friend").pluck(:sender_id)).uniq
  end  
  
  def friend_requester_ids
    received_friendships.where(status: "friend_request").pluck(:sender_id)
  end

  def friends
    (sent_friends + received_friends).uniq.filter { |u| !friend_requester_ids.include?(u.id) }
  end

  def new_friend_request?
    received_friendships.where(status: "friend_request").count > 0
  end

  def new_friend_request_count
    received_friendships.where(status: "friend_request").count
  end

  def new_notifications?
    notifications.where(viewed: false).count > 0
  end

  def new_notifications_count
    notifications.where(viewed: false).count
  end

  def likes_this?(post)
    likes.where(post_id: post.id).any?
  end

  def this_like_id(post)
    likes.where(post_id: post.id).first.id
  end

  def age
    dob = birthdate
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
