class AddIsStatusToPost < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :is_status, :boolean
  end
end
