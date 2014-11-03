class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :email, uniqueness: true

      t.integer :meta_id
      t.string  :meta_type

      t.timestamps
    end
  end
end
