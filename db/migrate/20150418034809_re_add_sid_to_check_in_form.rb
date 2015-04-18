class ReAddSidToCheckInForm < ActiveRecord::Migration
  def change
  	add_column :check_in_forms, :SID, :string
  end
end
