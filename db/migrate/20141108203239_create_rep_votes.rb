class CreateRepVotes < ActiveRecord::Migration
  def change
    create_table :rep_votes do |t|
      t.integer :rep_id
      t.integer :bill_id
      t.string :vote

      t.timestamps
    end
  end
end
