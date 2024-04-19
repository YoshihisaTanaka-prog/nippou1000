class AddMainToIsRemote < ActiveRecord::Migration[7.1]
  def change
    add_column :is_remotes, :is_remote, :integer
  end
end
