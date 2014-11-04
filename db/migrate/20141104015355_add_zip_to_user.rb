class AddZipToUser < ActiveRecord::Migration
  def change
    add_column :users, :zip, :integer
  end

  def down
    remove_colum :users, :zip
  end
end
