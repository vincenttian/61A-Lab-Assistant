class ChangeCheckInForm < ActiveRecord::Migration
  def change
  	remove_column :check_in_forms, :SID
  	remove_column :check_in_forms, :event
  	add_column :check_in_forms, :checkins, :integer, array:true, default: []
  end
end
