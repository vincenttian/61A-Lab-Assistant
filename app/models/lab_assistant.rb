# == Schema Information
#
# Table name: lab_assistants
#
#  id                    :integer          not null, primary key
#  created_at            :datetime
#  updated_at            :datetime
#  teaching_assistant_id :integer
#

class LabAssistant < ActiveRecord::Base
  belongs_to :teaching_assistant
end
