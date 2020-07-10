class StaticPagesController < ApplicationController

  def search
    @users = User.where("id != ? AND lower(name) like ?", current_user.id, "%#{params[:q].downcase}%")
    @sent_requests_users_id = current_user.sent_friendships.map { |r| r.receiver.id }
    @friends_ids = current_user.friends_ids
  end

end
