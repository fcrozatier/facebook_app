class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    receiver = User.find(params[:receiver_id])
    f = Friendship.create(sender: current_user ,receiver: receiver)
    f.notify
    flash[:notice] = "Friend Request sent to #{receiver.name}!" 
    redirect_back(fallback_location: root_path)
  end

  def update
    f = Friendship.find(params[:id])
    f.update(status: "friend")
    f.notify
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Friendship.find(params[:id]).delete
    redirect_back(fallback_location: root_path)
  end
end
