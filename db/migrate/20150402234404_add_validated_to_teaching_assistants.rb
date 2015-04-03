class AddValidatedToTeachingAssistants < ActiveRecord::Migration
  def change
  	add_column :teaching_assistants, :validated, :boolean, default: false
  end
end
