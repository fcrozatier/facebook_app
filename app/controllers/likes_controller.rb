class LikesController < ApplicationController

  def create
    current_user.likes.create(post_id: params[:post_id])
    Post.find(params[:post_id]).user.notifications.create(family: "like", what: params[:post_id], who: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Like.find(params[:id]).delete
    redirect_back(fallback_location: root_path)
  end
  
end
