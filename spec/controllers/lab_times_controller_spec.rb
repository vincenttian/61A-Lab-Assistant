require 'rails_helper'

RSpec.describe LabTimesController, :type => :controller do

  before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @ta = TeachingAssistant.create(first_name: 'first_name', last_name: 'last_name', email: 'test@test.com', password: 'password', id: 100)
      @user = Admin.create(first_name: 'first_name', last_name: 'last_name', email: 'test@test.com', password: 'password')
      @labtime = LabTime.create(open: Time.now(), close: Time.now(), day: Time.now(), course_id: 1)
      sign_in @user
  end

  describe "GET LabTimesController" do
    it "create the pages" do
        for course in ['CS61A', 'CS61B', 'CS61C', ''] 
            get :create, :lab_time => {course_id: course, day: 'Monday'}
        end

        for dia in ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'] do
            get :create, :lab_time => {course_id: 'CS61A', day: dia}
        end
    end

    it "get the ta" do
        TeachingAssistant.stub(:find).and_return(@ta)
        LabTime.stub(:find).and_return(@labtime)
        get :ta, :teaching_assistant => {id: 1, lab_timd_id: 1}
        expect(response).to have_http_status(302)
    end

    it "get the show" do
        LabTime.stub(:find).and_return(@labtime)
        get :show, :id => 1
        expect(response).to have_http_status(:success)
    end

    #it "get the update" do
    #    get :update#, :lab_time => {id: 1, lab_time_id: 1}
    #end
  end


end