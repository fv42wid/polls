class CreateReps < ActiveRecord::Migration
  def change
    create_table :reps do |t|
      t.string :nyt_id
      t.string :first_name
      t.string :last_name
      t.string :rep_url
      t.string :role
      t.string :gender
      t.string :party
      t.string :twitter_id
      t.string :youtube_id
      t.integer :seniority
      t.date :next_election
      t.string :govtrack_id
      t.string :state
      t.string :district
      t.date :start_date

      t.timestamps
    end
  end
end
