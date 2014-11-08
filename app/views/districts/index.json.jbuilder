json.array!(@districts) do |district|
  json.extract! district, :id, :state, :district, :zip
  json.url district_url(district, format: :json)
end
