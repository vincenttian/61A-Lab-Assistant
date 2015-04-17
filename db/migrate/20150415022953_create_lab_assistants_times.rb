class CreateLabAssistantsTimes < ActiveRecord::Migration
  def change
    create_table :lab_assistants_times do |t|
      t.belongs_to :lab_time, index: true
      t.belongs_to :lab_assistant, index: true
    end
  end
end