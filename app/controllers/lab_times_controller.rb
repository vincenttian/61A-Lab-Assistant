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
  	redirect_to admin_dashboard_path
  end


  def lt_params
  	params.require(:lab_time).permit(:open, :close, :day)
  end

end
