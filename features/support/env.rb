require "rubygems"
require "watir-webdriver"
require "rspec"
require "rspec/expectations"
require "selenium-webdriver"
require 'Capybara'
require "capybara/cucumber"
require 'yaml'


Capybara.register_driver :chrome do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome,:switches => %w[ --disable-extensions ])
end

Capybara.default_driver = :chrome
#Capybara.app_host = "https://test.salesforce.com/"
Capybara.app_host = "https://login.salesforce.com/"
Capybara.default_max_wait_time =60

ENV['TEST_ENV'] = 'Test'

def env
  case ENV['TEST_ENV']
    
  #when /Test/ then "https://test.salesforce.com/"
  when /Test/ then "https://login.salesforce.com/"
  else
    #"https://test.salesforce.com/"
    "https://login.salesforce.com/"
  end
end



