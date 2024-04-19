class AddUserToIsShareableZoho < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :is_shareable_zoho, :boolean
  end
end
