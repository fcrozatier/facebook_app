class CommentsController < ApplicationController
  
  def create
    comment = current_user.comments.build(comment_params)
    if comment.valid?
      comment.save
      Post.find(params[:comment][:post_id]).user.notifications.create(family: "comment", what: params[:comment][:post_id], who: current_user.id)
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

end
