# == Schema Information
#
# Table name: teaching_assistants
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string(255)
#  encrypted_password     :string(255)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string(255)
#  unlock_token           :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#

class TeachingAssistant < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  
  has_many :lab_assistants

  validates :first_name, presence: true
  validates :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def to_s
    name
  end

end
