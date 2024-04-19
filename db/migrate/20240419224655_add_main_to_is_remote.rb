class AddMainToIsRemote < ActiveRecord::Migration[7.1]
  def change
    add_column :mains, :is_remote, :integer
  end
end
