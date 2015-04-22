module LabAssistants
  class DashboardController < BaseController

    before_filter :authenticate_lab_assistant!

    def show
      @lt = LabTime.all
      @curr_user = current_user
      @preferred_times = current_user.preferred_lab_times
      @checkins = CheckInForm.where(SID: current_user.SID.to_s)
    end

  end
end
