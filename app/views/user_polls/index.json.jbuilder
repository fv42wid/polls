json.array!(@user_polls) do |user_poll|
  json.extract! user_poll, :id
  json.url user_poll_url(user_poll, format: :json)
end
