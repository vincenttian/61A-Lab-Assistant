class TeachingAssistantsController < ApplicationController

  def create
  	@ta = TeachingAssistant.new(ta_params)
  	@ta.password = 'password'
    case params[:teaching_assistant][:course_id]
    when 'CS61A'
      @ta.course_id = 1
    when 'CS61B'
      @ta.course_id = 2
    when 'CS61C'
      @ta.course_id = 3
    else
      # potential other classes
    end
  	if @ta.save
  	  redirect_to root_path, flash: { success: "You will receive an email when you are accepted as a Teaching Assistant" } 
  	else
  	  redirect_to root_path, flash: { error: @ta.errors.messages.to_s }
  	end
  end

  def show
    @ta = TeachingAssistant.find(params[:id])
    if current_user.is_a? Admin
      @header = "admin_header"
    end
  end

  def ta_params
  	params.require(:teaching_assistant).permit(:first_name, :last_name, :email)
  end

end
