require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'bundler/setup'
require 'go_to_mars'

Bundler.setup

RSpec.configure do |config|
  config.before(:each) do
  end
end