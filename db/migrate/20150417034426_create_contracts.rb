class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.belongs_to :lab_assistant, index: true
	    t.string :email_address
      t.string :first_name
      t.string :last_name
      t.string :student_id
      t.string :times_assisted
      t.string :units
      t.string :lab_assisting_rules
      t.string :conditions_to_view_anothers_code
      t.string :abide_by_rules
      t.timestamps
    end
  end
end
