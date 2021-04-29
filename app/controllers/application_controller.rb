class ApplicationController < ActionController::Base
  # before_action :authenticate_admin!,except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.kind_of?(Customer)
      root_path
    elsif resource.kind_of?(Admin)
      admin_customers_path
      # ひとまず管理者ログイン後は顧客一覧を表示。あとで注文一覧に変更する！
    end
  end




  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:adress,:telephone_number, :address, :is_active])
  end


end
