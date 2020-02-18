require 'certified'

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV["GOOGLE_CLIENT"],ENV["GOOGLE_SECRET"],
    skip_jwt: true
    provider :github, ENV["GITHUB_ID"],ENV["GITHUB_SECRET"]
    #  {:client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}
  end