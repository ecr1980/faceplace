class ProfilesController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    if (@user == current_user) && (current_user.profile == nil)
      @profile = Profile.new
    end
  end

  def new
    @profile = Profile.new
  end

  def create
    @user = current_user
    @profile = Profile.new(profile_params)
    @profile.save
    redirect_to user_show_path(@user)
  end

  private

  def profile_params
    params.require(:profile).permit(:profile_pic, :about, :user_id)
  end

end
