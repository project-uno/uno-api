class AddSchoolIdToUsers < ActiveRecord::Migration
  def up
    add_column :users, :school_id, :string
    remove_column :students, :student_id
    remove_column :teachers, :teacher_id
  end

  def down
    remove_column :users, :school_id, :string
    add_column :students, :student_id
    add_column :teachers, :teacher_id
  end
end
