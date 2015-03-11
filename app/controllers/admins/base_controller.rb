module Admins
  class BaseController < ApplicationController
    before_filter :authorize_access!
    before_filter :set_active_tab

    private

    def set_header
      @header = "admin_header"
    end

    def authorize_access!
      authorize! :manage, :admin_dashboard
    end

    def set_active_tab
      @active_tab = controller_name
    end

  end
end
