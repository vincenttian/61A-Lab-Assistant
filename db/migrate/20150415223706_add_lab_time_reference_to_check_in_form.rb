class AddLabTimeReferenceToCheckInForm < ActiveRecord::Migration
  def change
  	add_column :check_in_forms, :lab_time_id, :integer
  	add_index :check_in_forms, :lab_time_id
  end
end
