class RenameDistrict < ActiveRecord::Migration
  def change
    rename_column :reps, :district, :district_number
  end
end
