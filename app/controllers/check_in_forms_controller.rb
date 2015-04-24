class CheckInFormsController < ApplicationController
  def new
    @course = Course.find(current_user.course_id)
  end

  def create
    sid = params[:check_in_form][:SID]
    la = LabAssistant.where(SID: sid)
    if la.size == 0
      flash[:error] = "Couldn't find lab assistant with that SID, try again!"
      render new_check_in_form_path      
      return
    end

    @form = CheckInForm.new(check_in_form_params)
    @form.teaching_assistant = TeachingAssistant.find_by_id(current_user.id).to_s
    if @form.save
      flash[:notice] = "Thank you for checking in!"
      redirect_to check_in_form_path @form
    else  
      # flash message
      flash[:error] = "Couldn't process check-in, try again!"
      render new_check_in_form_path
    end
  end

  def show
    @form = CheckInForm.find(params[:id])
  end

  def edit
    @form = CheckInForm.find(params[:id])
  end

  def update
    @form = CheckInForm.find(params[:id])
    @form.update_attributes(check_in_form_params)
    redirect_to check_in_form_path @form
  end

  def destroy
    @form = CheckInForm.find(params[:id])
    @form.delete
    redirect_to teaching_assistants_dashboard_path
  end

  def index
  end

  private
  
  # filters out unwanted params
  def check_in_form_params
    params.require(:check_in_form).permit(:name, :SID, :event)
  end

end
