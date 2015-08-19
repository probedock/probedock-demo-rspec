require 'rubygems'
require 'bundler'
require 'probedock-rspec'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

require 'simplecov'
require 'coveralls'
Coveralls.wear!

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

ProbeDockRSpec.configure do |config|
  # Optional category to add to all the tests sent with this probe.
  config.project.category = 'RSpec'
end

require 'rspec'
require 'probedock_demo_rspec'
