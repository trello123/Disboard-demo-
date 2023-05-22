# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require 'capybara/rspec'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include Warden::Test::Helpers, type: :feature
  config.include FactoryBot::Syntax::Methods
end

Capybara.default_driver = :selenium_chrome_headless
Capybara.default_max_wait_time = 5
Capybara.app_host = 'http://127.0.0.1:3001'
Capybara.server_port = 3001
