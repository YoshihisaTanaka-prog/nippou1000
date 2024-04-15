class CreateToDos < ActiveRecord::Migration[7.1]
  def change
    create_table :to_dos do |t|
      t.string :name
      t.datetime :time_limit
      t.boolean :is_finished, null: false, default: false
      t.integer :main_id
      t.integer :user_id

      t.timestamps
    end
  end
end
