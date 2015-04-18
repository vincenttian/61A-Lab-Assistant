class CheckInFormsController < ApplicationController
  def new
  end

  def create
    @form = CheckInForm.new(check_in_form_params)
    @form.teaching_assistant = TeachingAssistant.find_by_id(current_user.id).name
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
    # handle check ins
    if params[:check_in_form][:check_in]
      @form = CheckInForm.find(params[:check_in_form][:lab_time_id])
      if params[:check_in_form][:id] != ""
        la = LabAssistant.find(params[:check_in_form][:id])
        if not @form.checkins.include? la.id
          @form.checkins = (@form.checkins.dup << la)
        end
        @form.save
      end
      redirect_to check_in_form_path @form
    else
      @form = CheckInForm.find(params[:id])
      @form.update_attributes(check_in_form_params)
      redirect_to check_in_form_path @form
    end
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
