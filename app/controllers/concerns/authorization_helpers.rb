module AuthorizationHelpers
  extend ActiveSupport::Concern

  included do
    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        if current_user.validated
          format.html { redirect_to path_after_access_denied(current_user), alert: exception.message }
          format.json { render json: { access_denied: true }, status: :forbidden }
        else
          if current_user.class == TeachingAssistant
            format.html { redirect_to root_path, alert: "Your Teaching Assistant account has not yet been approved by the admin." }
          elsif current_user.class == LabAssistant
            format.html { redirect_to root_path, alert: "Your Lab Assistant account has not yet been approved by the admin." }
          end
          sign_out current_user
          format.json { render json: { access_denied: true }, status: :forbidden }
        end
      end
    end
  end

  private

  def path_after_access_denied(user)
    if user
      after_sign_in_path_for(user)
    else
      root_path
    end
  end
end
