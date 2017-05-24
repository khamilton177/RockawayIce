class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :username
      t.string :email
      t.string :password
      t.integer :super

      t.timestamps
    end
  end
end
