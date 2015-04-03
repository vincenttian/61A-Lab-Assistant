class AddValidatedToLabAssistants < ActiveRecord::Migration
  def change
  	add_column :lab_assistants, :validated, :boolean, default: false
  end
end
