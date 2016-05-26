Rails.application.config.middleware.use OmniAuth::Builder do
  provider(:stripe_connect,
           Rails.application.secrets.stripe_client_id,
           Rails.application.secrets.stripe_sk)
end
