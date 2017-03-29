json.extract! hospital, :id, :name, :latitude, :longitude, :address, :phone, :about, :created_at, :updated_at
json.url hospital_url(hospital, format: :json)
