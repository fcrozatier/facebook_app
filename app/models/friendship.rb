class Friendship < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  def notify
    if status == "friend_request"
      message = "sent you a friend request!"
      receiver.notifications.create(family: "friend_request", message: message, what: id, who: sender_id)
    elsif status == "friend"
      message = "accepted your friend request!"
      sender.notifications.create(family: "message", message: message, what: id, who: receiver_id)
    end
  end
end
