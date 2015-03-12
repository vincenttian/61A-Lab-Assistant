module Admins
  class DashboardController < BaseController
    before_filter :authenticate_admin!

    def show
      @la = LabAssistant.all
      @ta = TeachingAssistant.all
    end
  end
end
