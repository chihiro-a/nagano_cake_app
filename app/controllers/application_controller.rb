class ApplicationController < ActionController::Base
  before_action :authenticate_admin!,except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_customer_sign_in_path_for(resource)
    cart_items_path(current_user.id)
    # ログイン後の遷移先が変わらない…
  end




  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:adress,:telephone_number])
  end
end
