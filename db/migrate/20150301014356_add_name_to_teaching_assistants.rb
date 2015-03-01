class AddNameToTeachingAssistants < ActiveRecord::Migration
  def change
    add_column :teaching_assistants, :first_name, :string
    add_column :teaching_assistants, :last_name, :string
  end
end
