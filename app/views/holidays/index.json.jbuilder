json.array!(@holidays) do |holiday|
  json.extract! holiday, 
  json.url holiday_url(holiday, format: :json)
end
