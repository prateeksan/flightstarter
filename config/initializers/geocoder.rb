# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

if Rails.env.test?
  Geocoder.configure(lookup: :test)
else
  Geocoder.configure(
    lookup: :google,
    api_key: Rails.application.secrets.google_geo_api_key
  )
end
