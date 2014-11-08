class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :state
      t.string :district
      t.string :zip

      t.timestamps
    end
  end
end
