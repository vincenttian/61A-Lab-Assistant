require 'rails_helper'

RSpec.describe TeachingAssistantsController, :type => :controller do

before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    @ta = TeachingAssistant.create(first_name: 'first_name', last_name: 'last_name', email: 'test@test.com', password: 'password', id: 100)
    @user = Admin.create(first_name: 'first_name', last_name: 'last_name', email: 'test@test.com', password: 'password')
    sign_in @user
end

    describe "GET teaching_assistant" do
    it "show teaching assistant page" do
        TeachingAssistant.stub(:find).and_return(@ta)
        get :show, :id => 1
    end
    end

    describe "GET create" do
    it "shows the create page" do
        TeachingAssistant.stub(:new).and_return(@ta)
        get :create, :teaching_assistant => {first_name: 'first', last_name: 'last', email: 'test@test.com', password: 'password'}
    end 
    end


end
