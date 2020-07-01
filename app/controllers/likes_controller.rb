class LikesController < ApplicationController

  def create
    current_user.likes.create(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Like.find(params[:id]).delete
    redirect_back(fallback_location: root_path)
  end
  
  private

  def likes_params
    params.require(:post_id).permit(:post_id)
  end
end
