class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    
  end

  def search
    @users = User.where("lower(name) like ?", "%#{params[:q].downcase}%").to_a
    @sent_requests_users_id = current_user.sent_friendships.to_a.map { |r| r.receiver.id }
    @friends_ids = current_user.friends_ids
  end

end
