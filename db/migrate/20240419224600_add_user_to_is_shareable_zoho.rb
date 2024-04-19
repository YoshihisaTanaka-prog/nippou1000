class AddUserToIsShareableZoho < ActiveRecord::Migration[7.1]
  def change
    add_column :is_shareable_zohos, :is_shareable_zoho, :boolean
  end
end
