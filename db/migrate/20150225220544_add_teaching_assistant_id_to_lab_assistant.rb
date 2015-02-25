class AddTeachingAssistantIdToLabAssistant < ActiveRecord::Migration
  def change
  	add_column :lab_assistants, :teaching_assistant_id, :integer
    add_index :lab_assistants, :teaching_assistant_id
  end
end
