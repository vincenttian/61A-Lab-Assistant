# == Schema Information
#
# Table name: check_in_forms
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  SID        :string(255)
#  event      :integer
#  created_at :datetime
#  updated_at :datetime
#

class CheckInForm < ActiveRecord::Base
  enum event: [ :lab, :office_hours, :guerilla_section, :hw_project_party ]
end
	
