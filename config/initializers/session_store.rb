# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_macrotweets.port49.com_session',
  :secret      => '8618a9454c69655a462a99568a20fa9448ddf2ff51b0c7aa4e9c610ae5fffd2b0a72bd80aa24c8ad3556b4b5450ca40919c8be5284bc1809f1fd849819bdd272'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
