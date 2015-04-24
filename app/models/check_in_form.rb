# == Schema Information
#
# Table name: check_in_forms
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  teaching_assistant :string(255)
#  SID                :string(255)
#  event              :integer
#  course_id          :integer
#

class CheckInForm < ActiveRecord::Base
  enum event: [ :lab, :office_hours, :guerilla_section, :hw_project_party ]

  validates :name, presence: true
  validates :course_id, presence: true

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |check_in|
        csv << check_in.attributes.values_at(*column_names)
      end
    end
  end

end
	
