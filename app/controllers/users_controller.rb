class UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    params.require(:user).permit(:img, :name, :introduction)
    if @user.update(:img, :name, :introduction)
      flash[:success] = メッセージ
      redirect_to :users
	else
      以下はエラー時の処理
    end
  end

  

  def account
    @user = current_user
  end

  def profile
    @user = current_user
    # if @user.save
    #   redirect_to :users
    # else
    #   render "new"
    # end
    # params.permit(:name, :img, :introdution)
  end
end
