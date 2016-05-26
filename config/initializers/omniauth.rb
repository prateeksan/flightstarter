# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :stripe_connect,
    Rails.application.secrets.stripe_client_id,
    Rails.application.secrets.stripe_sk,
    scope: 'read_write',
    stripe_landing: 'register'
end
