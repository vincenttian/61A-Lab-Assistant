class ReAddSidToCheckInForms < ActiveRecord::Migration
  def change
  	remove_column :check_in_forms, :checkins
  	remove_column :check_in_forms, :lab_time_id
  	add_column :check_in_forms, :SID, :string
  	add_column :check_in_forms, :event, :integer
  end
end
