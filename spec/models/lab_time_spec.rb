# == Schema Information
#
# Table name: lab_times
#
#  id         :integer          not null, primary key
#  open       :time
#  close      :time
#  day        :date
#  created_at :datetime
#  updated_at :datetime
#  course_id  :integer
#

require 'rails_helper'

RSpec.describe LabTime, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
