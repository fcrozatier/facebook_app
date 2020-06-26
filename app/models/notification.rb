class Notification < ApplicationRecord
  belongs_to :user

  MSG = { "friend_request" => "sent you a friend request!" } 

  def display_msg
    MSG[self.family]
  end
  
  def who_full_name
    User.find(self.who).name
  end
end
