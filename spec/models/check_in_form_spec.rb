# == Schema Information
#
# Table name: check_in_forms
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  SID                :string(255)
#  event              :integer
#  created_at         :datetime
#  updated_at         :datetime
#  teaching_assistant :string(255)
#

require 'rails_helper'

RSpec.describe CheckInForm, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
