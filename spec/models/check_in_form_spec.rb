# == Schema Information
#
# Table name: check_in_forms
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  teaching_assistant :string(255)
#  lab_time_id        :integer
#  checkins           :integer          default([]), is an Array
#

require 'rails_helper'

RSpec.describe CheckInForm, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
