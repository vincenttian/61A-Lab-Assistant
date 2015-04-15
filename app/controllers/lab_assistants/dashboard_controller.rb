module LabAssistants
  class DashboardController < BaseController

    before_filter :authenticate_lab_assistant!

    def show
      @lt = LabTime.all
    end
  end
end
