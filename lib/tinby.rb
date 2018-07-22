require 'tinby/version'

module Tinby
  def self.greet
    'Hello World!'
  end
end

Gem.find_files('tinderbot/*.rb').each { |file| require file }
Gem.find_files('tinderbot/**/*.rb').each { |file| require file }
