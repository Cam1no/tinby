require 'faraday'
require 'faraday_middleware'

module Tinby
  class Client
    TINDER_API_URL = 'https://api.gotinder.com'.freeze
    CONNECTION_USER_AGENT = 'Tinder/7.5.3 (iPhone; iOS 10.3.2; Scale/2.00)'.freeze

    def initialize
      build_tinder_connection
    end

    def get_authentication_token
      JSON.parse(@connection.post('/auth', facebook_token: facebook_authentication_token, facebook_id: facebook_user_id).body)['token']
    end

    private

    def build_tinder_connection
      @connection = Faraday.new(url: TINDER_API_URL) do |faraday|
        faraday.request :json
        faraday.adapter Faraday.default_adapter
      end
      @connection.headers[:user_agent] = CONNECTION_USER_AGENT
    end

    def facebook_authentication_token
      Tinby::Facebook.get_facebook_token
    end

    def facebook_user_id
      Tinby::Facebook.get_facebook_id
    end
  end
end
