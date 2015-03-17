module DeviseSettings
  extend ActiveSupport::Concern

  def current_user
    current_admin || current_teaching_assistant
  end

  def after_sign_in_path_for(user)
    return admin_dashboard_path if user.is_a? Admin
    # return teaching_assistants_dashboard_path if user.is_a? TeachingAssistant
    if user.is_a? TeachingAssistant
      return teaching_assistants_dashboard_path
    end
    fail "Bad user!"
  end
end
