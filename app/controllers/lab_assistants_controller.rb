class LabAssistantsController < ApplicationController
  
  def create
  	@la = LabAssistant.new(la_params)
    @la.password = 'password'
  	if @la.save
  	  redirect_to root_path, flash: { success: "You will receive an email when you are accepted as a Lab Assistant" }
  	else
  	  redirect_to root_path, flash: { error: @la.errors.messages.to_s }
  	end
  end

  def show
    @la = LabAssistant.find(params[:id])
  end

  def la_params
  	params.require(:lab_assistant).permit(:first_name, :last_name, :email)
  end

  # for submitting lab preferences for LabAssistants
  def update
    if params['lt_ids']
      current_user.preferred_lab_times = params['lt_ids'].map(&:to_i)
    else 
      current_user.preferred_lab_times = []
    end
    current_user.save
    redirect_to lab_assistants_dashboard_path
  end

end