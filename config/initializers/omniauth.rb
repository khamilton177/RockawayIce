Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["OAUTH_ID"], ENV["OAUTH_SECRET"],
    {prompt: "select_account"}
end
