module Tinby
  class Facebook
    FIND_FACEBOOK_ID_URL = 'https://findmyfbid.com'.freeze

    def get_facebook_token(email, password)
      TinderAuthFetcher.fetch_token(email, password)
    end

    def get_facebook_id(profile_url); end
  end
end
