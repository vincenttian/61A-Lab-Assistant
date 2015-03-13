module TeachingAssistants
  class BaseController < ApplicationController

    before_filter :authorize_access!
    before_filter :set_active_tab

    private

    def set_header
      @header = "ta_header"
    end

    def authorize_access!
      authorize! :manage, :teaching_assistants_dashboard
    end

    def set_active_tab
      @active_tab = controller_name
    end

  end
end
