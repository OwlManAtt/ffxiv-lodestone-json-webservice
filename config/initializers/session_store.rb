# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lodestone_api_session',
  :secret      => 'cd4469f480c472cdf060ad7cc7f9727e4281663ba8dc76d0cd9241f3461cbe1ffa13053928e478ece5d5578594ef36f8052464d8e99a5d56cfa3cacb620015d5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
