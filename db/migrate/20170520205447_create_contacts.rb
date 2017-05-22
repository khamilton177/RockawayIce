class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :email
      t.string :mobile

      t.timestamps
    end
  end
end
