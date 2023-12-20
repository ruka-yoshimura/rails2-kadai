class ProfilesController < ApplicationController
  before_action :set_user,only: %i[edit update]

  def edit
    @user = current_user
  end

  def update
        @user = current_user
        if @user.update(profile_params)
            flash[:notice] = "更新しました"
            redirect_to "/users/profile"
        else
            flash[:notice] = "更新できませんでした"
            render "users/profile"
        end
  end
    
  private
  def set_user
      # @user = User.find(current_user)
  end

  def profile_params
      params.require(:user).permit(:name, :introduction, :img, :avater, :avater_cash)
  end
end
