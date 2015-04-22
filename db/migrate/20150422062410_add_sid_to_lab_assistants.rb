class AddSidToLabAssistants < ActiveRecord::Migration
  def change
	add_column :lab_assistants, :SID, :integer
  end
end
