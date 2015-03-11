module Admins
  class DashboardController < BaseController
    before_filter :authenticate_admin!

    def show
    end
  end
end
