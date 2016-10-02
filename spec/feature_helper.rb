ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require 'capybara/rspec'
require File.expand_path('../../config/environment', __FILE__)
require 'capybara/rails'

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :deletion
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end

  config.include Warden::Test::Helpers
end
