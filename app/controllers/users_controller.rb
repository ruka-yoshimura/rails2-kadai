class UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def account
    @user = current_user
  end

  def profile
    @user = current_user
  end
end
