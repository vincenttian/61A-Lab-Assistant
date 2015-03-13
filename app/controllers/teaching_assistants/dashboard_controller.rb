module TeachingAssistants
  class DashboardController < BaseController

    before_filter :authenticate_teaching_assistant!

    def show
      @la = LabAssistant.all
      @ta = TeachingAssistant.all
    end
  end
end
