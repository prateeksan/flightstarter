Geocoder.configure(
  lookup: :google,
  api_key: Rails.application.secrets.google_geo_api_key
)
