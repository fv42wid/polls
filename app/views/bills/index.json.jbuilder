json.array!(@bills) do |bill|
  json.extract! bill, :id, :bill_id, :bill_uri, :title, :sponsor_uri, :introduced_date, :cosponsors, :committees, :latest_major_action_date, :latest_major_action
  json.url bill_url(bill, format: :json)
end
