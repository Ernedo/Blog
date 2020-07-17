class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :lname
      t.integer :idd

      t.timestamps
    end
  end
end
