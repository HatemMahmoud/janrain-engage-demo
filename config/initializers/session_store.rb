# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_janrain-engage-demo_session',
  :secret      => '9bea224a1a0c6eeb4a3810de48682093f081d9e8c775903ccf0a1d9be681a4e1f4df53f314b1503657cd8774c08d9e8328e553a46b963f1e8ee84b8e202fabca'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
