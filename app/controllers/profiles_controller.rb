class ProfilesController < ApplicationController


  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(profile_params)
      redirect_to "/users/profile"
    else
      render :edit
    end
  end
  
  private
  def profile_params
      params.require(:user).permit(:name, :introduction, :img)
    end
end
