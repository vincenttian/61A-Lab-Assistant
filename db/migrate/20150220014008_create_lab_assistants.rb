class CreateLabAssistants < ActiveRecord::Migration
  def change
    create_table :lab_assistants do |t|
      t.string :name
      t.timestamps
    end
  end
end
