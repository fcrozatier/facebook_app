class Notification < ApplicationRecord
  belongs_to :user

  MSG = { "friend_request_accepted" => "accepted your friend request!",
    "like" => "likes your post!", "comment" => "commented your post!"} 

  def display_msg
    MSG[self.family]
  end
  
  def who_full_name
    User.find(self.who).name
  end
end
