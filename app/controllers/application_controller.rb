
class ApplicationController < ActionController::Base
  #before_action :authenticate_user!,except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller? 
  def after_sign_in_path_for(resource)
    user_path(resource) # ログイン後に遷移するpathを設定
  end
  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email]) # 注目
    end
    
end

