json.array!(@turns) do |turn|
  json.extract! turn, :id, :day, :horain, :horater, :state
  json.url turn_url(turn, format: :json)
end
