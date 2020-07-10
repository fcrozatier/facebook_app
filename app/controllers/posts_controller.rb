class PostsController < ApplicationController

  def index
    @posts = current_user.posts.where("created_at < ?", DateTime.now ).order(created_at: :asc)
    current_user.friends.each do |friend|
      @posts += friend.posts.where("created_at < ?", DateTime.now ).order(created_at: :asc)
    end

    @new_post = current_user.posts.build
    @new_commment = current_user.comments.build
  end

  def create
    current_user.posts.create(post_params)

    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

end
