require 'faraday'
require 'faraday_middleware'

module Tinby
  class Client
    TINDER_API_URL = 'https://api.gotinder.com'.freeze
    CONNECTION_USER_AGENT = 'Tinder/7.5.3 (iPhone; iOS 10.3.2; Scale/2.00)'.freeze

    attr_reader :connection, :email, :password, :profile_url
    attr_accessor :logined

    def initialize(email, password, profile_url = '')
      @email = email
      @password = password
      @profile_url = profile_url
      @logined = false
      build_tinder_connection
    end

    def profile
      sign_in unless login?
      JSON.parse(connection.get('profile').body)
    end

    private

    def sign_in
      connection.token_auth(tinder_authentication_token)
      connection.headers['X-Auth-Token'] = tinder_authentication_token
      logined = true
    end

    def login?
      logined
    end

    def tinder_authentication_token
      @tinder_authentication_token ||= JSON.parse(auth_request)['token']
    end

    def auth_request
      connection.post('/auth', facebook_token: facebook_authentication_token, facebook_id: facebook_user_id).body
    end

    def build_tinder_connection
      @connection = Faraday.new(url: TINDER_API_URL) do |faraday|
        faraday.request :json
        faraday.adapter Faraday.default_adapter
      end
      connection.headers[:user_agent] = CONNECTION_USER_AGENT
    end

    def facebook_authentication_token
      Tinby::Facebook.get_facebook_token(email, password)
    end

    def facebook_user_id
      Tinby::Facebook.get_facebook_id(profile_url)
    end
  end
end
