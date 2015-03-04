module DeviseSettings
  extend ActiveSupport::Concern

  def current_user
    current_teaching_assistant
  end

  def after_sign_in_path_for(user)
    return teaching_assistant_dashboard_path if user.is_a? TeachingAssistant
    fail "Bad user!"
  end
end
