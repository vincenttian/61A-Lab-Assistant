module Admins
  class DashboardController < BaseController
    before_filter :authenticate_admin!

    def show
      @la = LabAssistant.order("first_name ASC, last_name ASC, email ASC")
      @ta = TeachingAssistant.order("first_name ASC, last_name ASC, email ASC")
      @lt = LabTime.all.to_a
      @valid_las = LabAssistant.where("validated = ?", true)
      @new_labtime = LabTime.new

      la_id = params[:la_to_change]
      if !la_id.nil?
        la_to_change = LabAssistant.find(la_id)
        toggle_la(la_to_change)
      end

      la_ids = params[:la_ids]
      if !la_ids.nil?
        las = LabAssistant.where(id: la_ids)
        process_form_action(las, params[:commit])
      end

      ta_ids = params[:ta_ids]
      if !ta_ids.nil?
        tas = TeachingAssistant.where(id: ta_ids)
        process_form_action(tas, params[:commit])
      end
    end

    private

    def validate_all(users)
      users.each do |user|
        user.validated = true
        user.save
      end
    end

    def invalidate_all(users)
      users.each do |user|
        user.validated = false
        user.save
      end
    end

    def toggle(user)
      if user.validated
        invalidate_all([user])
      else
        validate_all([user])
      end
    end

    def process_form_action(users, action)
      if action == 'Validate'
        validate_all(users)
      elsif action == 'Invalidate'
        invalidate_all(users)
      else
        users.each do |user|
          user.destroy
        end         
      end
    end

  end
end
