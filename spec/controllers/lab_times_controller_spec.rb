require 'rails_helper'

RSpec.describe LabTimesController, :type => :controller do

  before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @ta = TeachingAssistant.create(first_name: 'first_name', last_name: 'last_name', email: 'test@test.com', password: 'password', id: 100)
      @user = Admin.create(first_name: 'first_name', last_name: 'last_name', email: 'test@test.com', password: 'password')
      sign_in @user
  end

  describe "GET LabTimesController" do
    it "show the pages" do
        for course in ['CS61A', 'CS61B', 'CS61C', ''] 
            get :create, :lab_time => {course_id: course, day: 'Monday'}
        end

        for dia in ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'] do
            get :create, :lab_time => {course_id: 'CS61A', day: dia}
        end


    end

  end

end
