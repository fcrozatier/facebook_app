class StaticPagesController < ApplicationController
  def index
    
  end

  def search
    @users = User.where("lower(name) like ?", "%#{params[:q].downcase}%").to_a
    @sent_requests_users_id = current_user.sent_requests.to_a.map { |r| r.receiver.id }
  end

end
