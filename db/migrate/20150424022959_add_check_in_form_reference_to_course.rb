class AddCheckInFormReferenceToCourse < ActiveRecord::Migration
  def change
  	add_reference :check_in_forms, :course, index: true
  end
end
