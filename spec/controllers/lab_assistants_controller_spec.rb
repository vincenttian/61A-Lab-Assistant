require 'rails_helper'

RSpec.describe LabAssistantsController, :type => :controller do
    b = Course.create()
    it "show returns http success" do
	@request.env["devise.mapping"] = Devise.mappings[:admin]
	#b = Course.create()
	a = LabAssistant.create(first_name: 'first', last_name: 'last', email: 'test@test.com', password: 'password', course_id: b.id)	
	sign_in a
	LabAssistant.stub(:find).and_return(a)
	get "show", :id => b.id
	expect(response).to have_http_status(:success)
    end

    it "new_contract returns http success" do
	get :new_contract
	expect(response).to have_http_status(:success)
    end

let(:attribs){{first_name: 'first', last_name: 'last', email: 'test@test.com', password: 'password', course_id: b.id}}

    it "create returns http failure" do
	@request.env["devise.mapping"] = Devise.mappings[:admin]
	#b = Course.create()
	a = LabAssistant.create(first_name: 'first', last_name: 'last', email: 'test@test.com', password: 'password', course_id: 'CS61A')	
	sign_in a
	LabAssistant.stub(:new).and_return(a)
	for thing in ['CS61A', 'CS61B', 'CS61C', '']
	    attribs[:course_id] = thing
 	    get :create, {:lab_assistant => attribs}
	end
	expect(response).to have_http_status(302)
    end

let(:con_par){{first_name: 'first', last_name: 'last', email: 'test@test.com', password: 'password', course_id: '69'}}

    it "create_contract returns http failure" do
	a = LabAssistant.create(first_name: 'first', last_name: 'last', email: 'test@test.com', password: 'password', course_id: b.id)	
	sign_in a
	get :create_contract, {:contract => con_par}
	expect(response).to have_http_status(302)
    end
	
end
