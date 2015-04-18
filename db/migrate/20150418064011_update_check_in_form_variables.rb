class UpdateCheckInFormVariables < ActiveRecord::Migration
  def change
  	remove_column :check_in_forms, :checkins
  	CheckInForm.reset_column_information
  end
end
