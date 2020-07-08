class CommentsController < ApplicationController
  
  def create
    current_user.comments.create(comment_params)
    Post.find(params[:comment][:post_id]).user.notifications.create(family: "comment", what: params[:comment][:post_id], who: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

end
