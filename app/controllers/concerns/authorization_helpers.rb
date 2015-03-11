module AuthorizationHelpers
  extend ActiveSupport::Concern

  included do
    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.html { redirect_to path_after_access_denied(current_user), alert: exception.message }
        format.json { render json: { access_denied: true }, status: :forbidden }
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
