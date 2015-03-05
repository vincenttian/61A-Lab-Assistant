# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string(255)
#  unlock_token           :string(255)
#

require 'rails_helper'

RSpec.describe Admin, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
