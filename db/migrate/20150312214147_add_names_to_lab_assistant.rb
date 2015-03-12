class AddNamesToLabAssistant < ActiveRecord::Migration
  def change
  	add_column :lab_assistants, :first_name, :string
  	add_column :lab_assistants, :last_name, :string
  	add_column :lab_assistants, :email, :string
  end
end
