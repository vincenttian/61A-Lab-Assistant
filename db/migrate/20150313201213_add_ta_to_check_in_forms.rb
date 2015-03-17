class AddTaToCheckInForms < ActiveRecord::Migration
  def change
	add_column :check_in_forms, :teaching_assistant, :string
  end
end
