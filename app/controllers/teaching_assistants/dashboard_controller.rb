module TeachingAssistants
  class DashboardController < BaseController

    before_filter :authenticate_teaching_assistant!

    def show
      @forms = CheckInForm.all
    end
  end
end
