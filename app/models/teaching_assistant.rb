# == Schema Information
#
# Table name: teaching_assistants
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class TeachingAssistant < ActiveRecord::Base
  has_many :lab_assistants
end
