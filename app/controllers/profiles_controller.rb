class ProfilesController < ApplicationController

  def create
    current_user.create_profile(profile_params)
    redirect_back(fallback_location: profile_path)
  end

  def update
    current_user.profile.update(profile_params)
    redirect_back(fallback_location: profile_path)
  end

  def show
    @profile = current_user.profile
    @posts = current_user.posts
  end

  private

  def profile_params
    params.require(:profile).permit(:photo)
  end

  
end
