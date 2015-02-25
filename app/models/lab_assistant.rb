# == Schema Information
#
# Table name: lab_assistants
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class LabAssistant < ActiveRecord::Base
  belongs_to :teaching_assistant
end
