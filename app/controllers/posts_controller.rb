class PostsController < ApplicationController

  def index
    @posts = Post.where(user_id: current_user.friends_ids<<current_user.id).order(created_at: :desc)

    @new_post = current_user.posts.build
    @new_commment = current_user.comments.build
  end

  def create
    current_user.posts.create(post_params)

    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:body, :photo)
  end

end
