class CreatePoints < ActiveRecord::Migration[7.1]
  def change
    create_table :points do |t|
      t.string :text
      t.integer :is_good
      t.integer :main_id

      t.timestamps
    end
  end
end
