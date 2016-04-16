json.array!(@tomaturnos) do |tomaturno|
  json.extract! tomaturno, :id, :state
  json.url tomaturno_url(tomaturno, format: :json)
end
