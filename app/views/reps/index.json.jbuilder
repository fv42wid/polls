json.array!(@reps) do |rep|
  json.extract! rep, :id, :nyt_id, :first_name, :last_name, :rep_url, :role, :gender, :party, :twitter_id, :youtube_id, :seniority, :next_election, :govtrack_id, :state, :district, :start_date
  json.url rep_url(rep, format: :json)
end
