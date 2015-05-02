module Admins
  class DashboardController < BaseController
    before_filter :authenticate_admin!

    def show
      @la = LabAssistant.order("course_id ASC, first_name ASC, last_name ASC, email ASC")
      @ta = TeachingAssistant.order("course_id ASC, first_name ASC, last_name ASC, email ASC")
      @lt = LabTime.order("course_id ASC, id ASC").to_a
      @a_valid_tas = TeachingAssistant.where("validated = ?", true).where(course_id: 1)
      @b_valid_tas = TeachingAssistant.where("validated = ?", true).where(course_id: 2)
      @c_valid_tas = TeachingAssistant.where("validated = ?", true).where(course_id: 3)
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

    def match
      las = LabAssistant.includes(:lab_times).where('validated =?', true).order(preferred_lab_times: :asc)
      las.to_a.each do |la|
        # only assign lab assistants without lab time
        if not la.lab_times.to_a.size > 0
          lab_times = la.preferred_lab_times
          la.preferred_lab_times.shuffle.each do |f|
            l = LabTime.find(f)
            # continue iterating through shuffled array if # lab assistants greater than 6
            if l.lab_assistants.size > 6
              next
            else
              la.lab_times << l
              la.save
              break
            end
          end
        else
          return redirect_to admins_dashboard_path, flash: { error: "No matches were made" } 
        end
      end
      redirect_to admins_dashboard_path, flash: { success: "Successful matches!" } 
    end

    def export_check_ins
      @check_ins =  CheckInForm.order(:name)
      respond_to do  |format| 
        format.csv { send_data @check_ins.to_csv, type: 'text/csv', filename: 'check_ins.csv' }
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
