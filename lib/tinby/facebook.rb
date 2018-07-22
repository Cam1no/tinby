require 'tinder_auth_fetcher'

module Tinby
  module Facebook
    FIND_FACEBOOK_ID_URL = 'https://findmyfbid.com'.freeze

    def self.get_facebook_token(email, password)
      TinderAuthFetcher.fetch_token(email, password)
    end

    def self.get_facebook_id(profile_url); end
  end
end
