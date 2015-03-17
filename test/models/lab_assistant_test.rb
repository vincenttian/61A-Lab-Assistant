# == Schema Information
#
# Table name: lab_assistants
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  teaching_assistant_id :integer
#  first_name            :string(255)
#  last_name             :string(255)
#  email                 :string(255)
#

require 'test_helper'

class LabAssistantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
