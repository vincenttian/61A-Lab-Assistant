module DeviseSettings
  extend ActiveSupport::Concern

  def current_user
    current_admin
  end

  def after_sign_in_path_for(user)
    return admin_dashboard_path if user.is_a? Admin
    fail "Bad user!"
  end
end
