class RenamePasswordColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :admins, :password, :uid
  end
end
