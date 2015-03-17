class CreateCheckInForms < ActiveRecord::Migration
  def change
    create_table :check_in_forms do |t|
      t.string :name
      t.string :SID
      t.integer :event

      t.timestamps
    end
  end
end
