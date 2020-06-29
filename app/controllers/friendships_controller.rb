class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    receiver = User.find(params[:receiver_id])
    current_user.sent_friends << receiver
    receiver.notifications.create(family: "friend_request", who: current_user.id)
    flash[:notice] = "Friend Request sent to #{receiver.name}!" 
    redirect_back(fallback_location: root_path)
  end
end
