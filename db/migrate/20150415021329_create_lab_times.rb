class CreateLabTimes < ActiveRecord::Migration
  def change
    create_table :lab_times do |t|
      t.time :open
      t.time :close
      t.date :day
      t.timestamps
    end
  end
end