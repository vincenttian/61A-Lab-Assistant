require 'rails_helper'

RSpec.describe LabAssistantsController, :type => :controller do	
    it "create returns http success" do
	@request.env["devise.mapping"] = Devise.mappings[:admin]
	b = Course.create()
	a = LabAssistant.create(first_name: 'first', last_name: 'last', email: 'test@test.com', password: 'password', course_id: b.id)	
	sign_in a
	LabAssistant.stub(:find).and_return(a)
	get "show", :id => b.id
	expect(response).to have_http_status(:success)
    end

    it "update returns http success" do
	get :new_contract
	expect(response).to have_http_status(:success)
    end
  
b = Course.create() 
let(:attribs){{first_name: 'first', last_name: 'last', email: 'test@test.com', password: 'password', course_id: b.id}}

    it "create_contract returns http success" do
	@request.env["devise.mapping"] = Devise.mappings[:admin]
	b = Course.create()
	a = LabAssistant.create(first_name: 'first', last_name: 'last', email: 'test@test.com', password: 'password', course_id: b.id)	
	sign_in a
	LabAssistant.stub(:new).and_return(a)	
	get :create, {:lab_assistant => attribs}
	expect(response).to have_http_status(302)
    end
	
end
