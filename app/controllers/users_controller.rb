class UsersController < ApplicationController

  
  def account
    @user = current_user
  end
  
  def profile
    @user = current_user
    # @user.img = "https://rails-02-sample.herokuapp.com/assets/common/default-avatar-7a6cbfd7993e89f24bfc888f4a035a83c6f1428b8bdc47eed9095f2799a40153.png"
  end
end
