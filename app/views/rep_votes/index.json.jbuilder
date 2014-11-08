json.array!(@rep_votes) do |rep_vote|
  json.extract! rep_vote, :id, :rep_id, :bill_id, :vote
  json.url rep_vote_url(rep_vote, format: :json)
end
