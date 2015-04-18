class RemoveThingsFromCheckInForm < ActiveRecord::Migration
  def change
  	remove_column :check_in_forms, :lab_time_id
  	remove_column :check_in_forms, :checkins
  end
end
