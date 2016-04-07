require_relative 'rspec'

World(RestfulSrvr::API::RSpec)

Given(/^the RestfulSrvr API server's cache is up to date$/) do
  cache_builder.build
end

Given(/^the RestfulSrvr API server's cache is empty$/) do
  cache_manager.clear
end
