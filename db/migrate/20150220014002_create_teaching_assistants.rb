class CreateTeachingAssistants < ActiveRecord::Migration
  def change
    create_table :teaching_assistants do |t|
      t.string :name
      t.timestamps
    end
  end
end
