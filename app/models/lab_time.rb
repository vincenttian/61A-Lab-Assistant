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
#

class LabTime < ActiveRecord::Base
  has_and_belongs_to_many :lab_assistants
  has_and_belongs_to_many :teaching_assistants

  validates :open, presence: true
  validates :close, presence: true
  validates :day, uniqueness: true
end
