class ProfilesController < ApplicationController

  def create
    current_user.create_profile(profile_params)
    redirect_back(fallback_location: user_profile_path(current_user.id))
  end

  def update
    current_user.profile.update(profile_params)
    redirect_back(fallback_location: user_profile_path(current_user.id))
  end

  def show
    @user = User.find(params[:user_id])
    @profile = @user.profile
    @posts = @user.posts
  end

  private

  def profile_params
    params.require(:profile).permit(:photo)
  end

  
end
