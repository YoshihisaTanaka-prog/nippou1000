class CreateMains < ActiveRecord::Migration[7.1]
  def change
    create_table :mains do |t|
      t.string :title
      t.text :first_comment
      t.text :second_comment
      t.integer :user_id
      t.integer :vol

      t.timestamps
    end
  end
end
