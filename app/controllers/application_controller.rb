class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
    devise_parameter_sanitizer.permit(:profile, keys: [:img, :introduction])
  end

  def configure_permitted_parameters
  end

  # def profile_parameters
  #   params.require(:user)permit(:img, :name,  :introduction)
  # end
end
