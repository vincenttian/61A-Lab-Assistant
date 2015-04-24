class AddReferenceToLabTime < ActiveRecord::Migration
  def change
  	add_reference :lab_times, :course, index: true
  end
end
