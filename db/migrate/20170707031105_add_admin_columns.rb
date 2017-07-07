class AddAdminColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :provider, :string
    add_column :admins, :oauth_expires_at, :datetime
  end
end
