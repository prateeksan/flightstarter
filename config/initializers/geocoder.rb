# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

Geocoder.configure(
  lookup: :google,
  api_key: Rails.application.secrets.google_geo_api_key
)
