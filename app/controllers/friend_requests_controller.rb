class FriendRequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    receiver = User.find(params[:receiver_id])
    FriendRequest.create(sender: current_user, receiver: receiver)
    receiver.notifications.create(family: "friend_request", who: current_user.id)
    flash[:notice] = "Friend Request sent to #{receiver.name} !" 
    redirect_back(fallback_location: root_path)
  end
end
