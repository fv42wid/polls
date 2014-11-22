class Rename < ActiveRecord::Migration
  def change
    rename_column :districts, :district, :district_number
  end
end
