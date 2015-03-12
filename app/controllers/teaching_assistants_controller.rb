class TeachingAssistantsController < ApplicationController

  def create
  	@ta = TeachingAssistant.new(ta_params)
  	@ta.password = 'password'
  	if @ta.save
  	  redirect_to root_path, flash: { success: "You will receive an email when you are accepted as a Teaching Assistant" } 
  	else
  	  redirect_to root_path, flash: { error: @ta.errors.messages.to_s }
  	end
  end

  def show
    @ta = TeachingAssistant.find(params[:id])
  end

  def ta_params
  	params.require(:teaching_assistant).permit(:first_name, :last_name, :email)
  end

end
