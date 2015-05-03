require 'rails_helper'

RSpec.describe CheckInFormsController, :type => :controller do


  describe "GET new" do
    before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:admin]
        b = Course.create()
        a = TeachingAssistant.create(first_name: 'first_name', last_name: 'last_name', email: 'test@test.com', password: 'password', course_id: b.id)
        sign_in a
    end

    it "returns http success" do
       get :new
       expect(response).to have_http_status(:success)
    end
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  #describe "general stuff" do
  #  it "show returns http success" do
  #    get :check_in_form_params
  #    expect(response).to have_http_status(:success)
  #  end
  #end

end
