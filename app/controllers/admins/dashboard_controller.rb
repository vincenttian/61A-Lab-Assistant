module Admins
  class DashboardController < BaseController
    before_filter :authenticate_admin!

    def show
      @la = LabAssistant.order("first_name ASC, last_name ASC, email ASC")
      @ta = TeachingAssistant.order("first_name ASC, last_name ASC, email ASC")

      la_id = params[:la_to_change]
      if !la_id.nil?
        la_to_change = LabAssistant.find(la_id)
        toggle_la(la_to_change)
      end

      la_ids = (params[:la_ids] || [])
      la_ids.each do |id|
        la = LabAssistant.find(id)
        if params[:commit] == 'Validate'
          validate_la(la)
        elsif params[:commit] == 'Invalidate'
          invalidate_la(la)
        else
          la.destroy          
        end
      end
    end

    private

    def validate_la(la)
      la.validated = true
      la.save
    end

    def invalidate_la(la)
      la.validated = false
      la.save
    end

    def toggle_la(la)
      if la.validated
        invalidate_la(la)
      else
        validate_la(la)
      end
    end
  end
end
