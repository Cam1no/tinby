require 'selenium-webdriver'
module Tinby
  class Facebook
    FIND_FACEBOOK_ID_URL = 'https://findmyfbid.com'.freeze

    attr_reader :driver, :profile_url

    def initialize(profile_url)
      @profile_url = profile_url
      @driver = initialize_selenium_driver
    end

    def fetch_facebook_id
      open_findfbid
      fill_in_user_profile_url
      submit
      find_facebook_id
    end

    private

    def initialize_selenium_driver
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--headless')
      Selenium::WebDriver.for :chrome, options: options
    end

    def open_findfbid
      driver.get(FIND_FACEBOOK_ID_URL)
    end

    def fill_in_user_profile_url
      driver.find_element(:name, 'url').send_keys(profile_url)
    end

    def submit
      driver.find_element(:class, 'btn').click
    end

    def find_facebook_id
      driver.find_element(:tag_name, 'code').text
    end
  end
end
