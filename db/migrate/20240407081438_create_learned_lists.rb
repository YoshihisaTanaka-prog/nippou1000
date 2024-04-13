class CreateLearnedLists < ActiveRecord::Migration[7.1]
  def change
    create_table :learned_lists do |t|
      t.text :text
      t.integer :is_learned
      t.integer :main_id

      t.timestamps
    end
  end
end
