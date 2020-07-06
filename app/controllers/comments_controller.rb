class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def index

  end

  def create
    current_user.comments.create(comment_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

end
