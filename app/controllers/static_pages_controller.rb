class StaticPagesController < ApplicationController
  def index
    
  end

  def search
    @users = User.where("lower(name) like ?", "%#{params[:q].downcase}%").to_a
    @results
    @users.each do |user|
      
    end
  end

  def create_friend_request
    receiving = User.find(params[:receiving_id])
    FriendRequest.create(sending: current_user, receiving: receiving)
    flash[:notice] = "Friend Request sent to #{receiving.name} !" 
    render :index
  end
end
