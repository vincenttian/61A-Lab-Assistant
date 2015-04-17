class CreateLabTimesTeachingAssistants < ActiveRecord::Migration
  def change
    create_table :lab_times_teaching_assistants do |t|
      t.belongs_to :lab_time, index: true
      t.belongs_to :teaching_assistant, index: true
    end
  end
end
