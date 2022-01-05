require 'csv'
require 'selenium-webdriver'
require 'capybara'

URL = 'https://onliner.by'
BLOCK = 'ТЕХНОЛОГИИ'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

Capybara.javascript_driver = :firefox
Capybara.configure do |config|
  config.default_driver = :selenium
end

browser = Capybara.current_session
browser.visit URL

browser.all('a', text: BLOCK).first.click
links = browser.all('a', class: 'news-tiles__stub').map { |item| item['href'] }

result = links.map do |link|
  browser.visit(link)
  image = browser.find('div', class: 'news-header__image')['style'].scan(/https:.+\.jpeg/).first
  title = browser.find('h1').text
  text = browser.find('.news-text').text[0...200]
  [image, title, text]
end

CSV.open('data.csv', 'w') do |csv|
  result.each { |row| csv << row }
end
