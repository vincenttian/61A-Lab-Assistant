class AddPreferredLabTimesToLabAssistant < ActiveRecord::Migration
  def change
  	add_column :lab_assistants, :preferred_lab_times, :integer, array:true, default: []
  end
end
