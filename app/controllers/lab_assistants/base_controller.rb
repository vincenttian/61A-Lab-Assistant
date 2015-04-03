module LabAssistants
  class BaseController < ApplicationController

    before_filter :authorize_access!
    before_filter :set_active_tab

    private

    def set_header
      @header = "la_header"
    end

    def authorize_access!
      authorize! :manage, :lab_assistants_dashboard
    end

    def set_active_tab
      @active_tab = controller_name
    end

  end
end
