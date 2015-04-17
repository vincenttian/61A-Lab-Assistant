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

  def new_contract
    @new_contract = Contract.new
  end

  def create_contract
    la = LabAssistant.new
    la.first_name = contract_params[:first_name]
    la.last_name = contract_params[:last_name]
    la.email = contract_params[:email_address]

    if la.valid?
      contract = la.build_contract(contract_params)
      if contract.save
        la.validated = true
        la.save
        redirect_to root_path, flash: { success: "You've submitted your contract as a Lab Assistant, you may now log in." }
      else
        redirect_to lab_assistants_contract_sign_up_path, flash: { error: "Something was wrong with the contract you entered." }
      end
    else
      redirect_to lab_assistants_contract_sign_up_path,  flash: { error: la.errors.messages.to_s }
    end
  end

private

  def contract_params
    params.require(:contract).permit(:first_name, :last_name, :email_address, :student_id, :times_assisted, :units, :lab_assisting_rules, :conditions_to_view_anothers_code, :abide_by_rules)
  end


end