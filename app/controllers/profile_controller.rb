class ProfileController < ApplicationController
  before_action :set_user,only: %i[edit update]

  def edit
    @user = current_user
  end

  def profile_parameters
    # params.require(:user)permit(:img, :name,  :introduction)
  end

#   def update
#     if @user.update(user_params)
#         redirect_to profile_path,success: "ユーザーを更新しました"
#     else
#         flash.now[:danger] = "ユーザーを更新できませんでした"
#         render :edit
#     end
    
  def update
        # @user = User.find_by(id: session[:user_id])
    if current_user == @user
        if @user.update(params.require(:user).permit(:name, :introduction, :img))
            flash[:notice] = "更新しました"
            redirect_to "/users/profile"
        else
            flash[:notice] = "更新できませんでした"
            render "users/profile"
        end
    else
        redirect_to "/"
    end
  end
    
  private
  def set_user
      @user = User.find(current_user.id)
  end

  def user_params
      params.require(:user).permit(:email,:first_name,:last_name,:avater,:avater_cash)
  end
end
