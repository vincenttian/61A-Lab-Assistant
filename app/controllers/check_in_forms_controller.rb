class CheckInFormsController < ApplicationController
  def new
  end

  def create
    @form = CheckInForm.new(check_in_form_params)
    if @form.save
      redirect_to check_in_form_path @form
    else  
      # flash message
      render new_check_in_form_path
    end
  end

  def show
    @form = CheckInForm.find(params[:id])
    lab_time = LabTime.find(@form.lab_time_id)
    # below refers to all lab assistants that should be checking in
    @las = lab_time.lab_assistants
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
