class AddMobileNoToAdminUser < ActiveRecord::Migration[7.2]
  def change
    add_column :admin_users, :mobile_no, :string
  end
end
