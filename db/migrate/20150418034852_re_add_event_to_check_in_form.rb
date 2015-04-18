class ReAddEventToCheckInForm < ActiveRecord::Migration
  def change
  	add_column :check_in_forms, :event, :integer
  end
end
