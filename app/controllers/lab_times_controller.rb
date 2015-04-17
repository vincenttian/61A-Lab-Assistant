class LabTimesController < ApplicationController

  def create
  	@lt = LabTime.new(lt_params)
  	days_of_week = {
	    "Monday" => Date.new(2000, 1, 3),
	    "Tuesday" => Date.new(2000, 1, 4),
	    "Wednesday" => Date.new(2000, 1, 5),
	    "Thursday" => Date.new(2000, 1, 6),
	    "Friday" => Date.new(2000, 1, 7),
	    "Saturday" => Date.new(2000, 1, 1),
	    "Sunday" => Date.new(2000, 1, 2)
	  }
	case params['lab_time']['day']
  	when 'Sunday'
  	  @lt.day = days_of_week['Sunday']
  	when 'Monday'
  	  @lt.day = days_of_week['Monday']
  	when 'Tuesday'
  	  @lt.day = days_of_week['Tuesday']
  	when 'Wednesday'
  	  @lt.day = days_of_week['Wednesday']
  	when 'Thursday'
  	  @lt.day = days_of_week['Thursday']
  	when 'Friday'
  	  @lt.day = days_of_week['Friday']
  	when 'Saturday'
  	  @lt.day = days_of_week['Saturday']
  	end
  	@lt.save
    # create check in forms for entire semester
    1.upto(13) do |i|
      c = CheckInForm.create(name: "Lab#{i}")
      @lt.check_in_forms << c
    end
  	redirect_to admin_dashboard_path
  end

  def ta
    ta = TeachingAssistant.find(params['teaching_assistant']['id'])
    lt = LabTime.find(params['teaching_assistant']['lab_time_id'])
    ta.lab_times << lt
    redirect_to admin_dashboard_path
  end


  def lt_params
  	params.require(:lab_time).permit(:open, :close, :day)
  end

  def show
    @l = LabTime.find(params['id'])
    @las = LabAssistant.where("validated = ?", true)
    @curr_las = @l.lab_assistants
  end

  # assigns lab assistants
  def update
    lt = LabTime.find(params['lab_time']['lab_time_id'])
    if params['lab_time']['id'] != ""
      la = LabAssistant.find(params['lab_time']['id'])
      if not lt.lab_assistants.include? la
        lt.lab_assistants << la
      end
    end
    redirect_to lab_time_path(lt)
  end

end
