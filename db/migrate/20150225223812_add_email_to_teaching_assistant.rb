class AddEmailToTeachingAssistant < ActiveRecord::Migration
  def change
    add_column :teaching_assistants, :email, :string
  end
end
