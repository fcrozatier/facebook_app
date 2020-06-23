class StaticPagesController < ApplicationController
  def index
    
  end

  def search
    @users = User.where("lower(name) like ?", "%#{params[:q].downcase}%").to_a
  end
end
