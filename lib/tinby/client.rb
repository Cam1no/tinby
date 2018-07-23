require 'faraday'
require 'faraday_middleware'
require 'tinder_auth_fetcher'

module Tinby
  class Client
    class Unauthorized < StandardError; end
    TINDER_API_URL = 'https://api.gotinder.com'.freeze
    CONNECTION_USER_AGENT = 'Tinder/7.5.3 (iPhone; iOS 10.3.2; Scale/2.00)'.freeze

    attr_reader :connection, :email, :password, :facebook
    attr_accessor :logined

    def initialize(email, password, profile_url)
      @email = email
      @password = password
      @facebook = Tinby::Facebook.new(profile_url)
      @logined = false
      build_tinder_connection
    end

    def profile
      sign_in unless login?
      response = connection.get('profile').body
      raise Unauthorized if response == 'Unauthorized'
      JSON.parse(response, symbolize_names: true)
    end

    def recommended_users
      sign_in unless login?
      response = connection.post('user/recs').body
      raise Unauthorized if response == 'Unauthorized'
      results = JSON.parse(response)['results']
      users = results.reject { |r| r['name'] == 'Tinder Team' } if results
      users || []
    end

    def matches
      sign_in unless login?
      response = connection.post('updates', last_activity_date: '').body
      response ? JSON.parse(response) : []
    end

    def like(user_id)
      sign_in unless login?
      connection.get("like/#{user_id}")
    end

    def dislike(user_id)
      sign_in unless login?
      connection.get("pass/#{user_id}")
    end

    def send_message(user_id, message)
      sign_in unless login?
      connection.post("user/matches/#{user_id}", message: message)
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
      TinderAuthFetcher.fetch_token(email, password)
    end

    def facebook_user_id
      facebook.fetch_facebook_id
    end
  end
end
