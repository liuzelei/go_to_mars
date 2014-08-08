require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'bundler/setup'
require 'polylink_api'

Bundler.setup

RSpec.configure do |config|
  config.before(:each) do
  end
end