class SessionsController < Devise::SessionsController
  private

  def after_sign_in_path_for(_resource)
    current_user.is_client? ? current_user : admin_dashboard_path
  end
end
