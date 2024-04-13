class CreateWhatToDos < ActiveRecord::Migration[7.1]
  def change
    create_table :what_to_dos do |t|
      t.string :name
      t.time :from_time
      t.time :to_time
      t.integer :main_id

      t.timestamps
    end
  end
end
