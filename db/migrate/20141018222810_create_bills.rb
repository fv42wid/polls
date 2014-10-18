class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :bill_id
      t.string :bill_uri
      t.string :title
      t.string :sponsor_uri
      t.date :introduced_date
      t.string :cosponsors
      t.string :committees
      t.date :latest_major_action_date
      t.text :latest_major_action

      t.timestamps
    end
  end
end
