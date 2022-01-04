require 'csv'
require 'selenium-webdriver'
require 'capybara'

URL = 'https://onliner.by'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

Capybara.javascript_driver = :firefox
Capybara.configure do |config|
  config.default_driver = :selenium
end

def session
  browser = Capybara.current_session
  browser.visit URL
end

session