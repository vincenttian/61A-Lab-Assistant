module LabAssistants
  class DashboardController < BaseController

    before_filter :authenticate_lab_assistant!

    def show
    end
  end
end
