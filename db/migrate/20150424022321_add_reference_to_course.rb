class AddReferenceToCourse < ActiveRecord::Migration
  def change
  	add_reference :teaching_assistants, :course, index: true
  	add_reference :lab_assistants, :course, index: true
  end
end
