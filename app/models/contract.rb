# == Schema Information
#
# Table name: contracts
#
#  id                               :integer          not null, primary key
#  lab_assistant_id                 :integer
#  email_address                    :string(255)
#  first_name                       :string(255)
#  last_name                        :string(255)
#  student_id                       :string(255)
#  times_assisted                   :string(255)
#  units                            :string(255)
#  lab_assisting_rules              :string(255)
#  conditions_to_view_anothers_code :string(255)
#  abide_by_rules                   :string(255)
#  created_at                       :datetime
#  updated_at                       :datetime
#

class Contract < ActiveRecord::Base
	belongs_to :lab_assistant
end
