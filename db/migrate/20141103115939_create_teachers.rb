class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :teacher_id

      t.timestamps
    end
  end
end
