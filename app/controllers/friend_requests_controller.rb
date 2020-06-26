class FriendRequestsController < ApplicationController
  before_action :authenticate_user!

  def create_friend_request
    receiver = User.find(params[:receiver_id])
    FriendRequest.create(sender: current_user, receiver: receiver)
    receiver.notifications.create(family: "friend_request", who: current_user.id)
    redirect_back(fallback_location: root_path)
  end
end
