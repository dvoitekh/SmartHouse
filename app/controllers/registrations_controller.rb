class RegistrationsController < Devise::RegistrationsController
  private

  def after_sign_up_path_for(_resource)
    current_user.is_client? ? root_path : admin_dashboard_path
  end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
