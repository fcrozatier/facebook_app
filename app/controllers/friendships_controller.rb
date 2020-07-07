class FriendshipsController < ApplicationController

  def index
    @new_friend_requests = current_user.received_friendships.where(status: "friend_request")
  end

  def create
    receiver = User.find(params[:receiver_id])
    f = Friendship.create(sender: current_user ,receiver: receiver)
    flash[:notice] = "Friend Request sent to #{receiver.name}!" 
    redirect_back(fallback_location: root_path)
  end

  def update
    f = Friendship.find(params[:id])
    f.update(status: "friend")
    f.notify
    flash[:notice] = "#{f.sender.name} is now your friend!" 
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Friendship.find(params[:id]).delete
    flash[:notice] = "Friend request deleted!" 
    redirect_back(fallback_location: root_path)
  end
end
