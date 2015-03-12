class HomeController < ApplicationController

  def index
  	@teachingassistant = TeachingAssistant.new
  	@labassistant = LabAssistant.new
  end

end
