class StaticPagesController < ApplicationController
  def index
    
  end

  def search
    @users = User.where("lower(name) like ?", "%#{params[:q].downcase}%").to_a
    @sent_requests_users_id = current_user.sent_requests.to_a.map { |r| r.receiver.id }
  end

  def create_friend_request
    receiver = User.find(params[:receiver_id])
    FriendRequest.create(sender: current_user, receiver: receiver)
    flash[:notice] = "Friend Request sent to #{receiver.name} !" 
    redirect_back(fallback_location: root_path)
  end
end
