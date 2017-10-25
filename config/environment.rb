# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'rubygems'

require 'uri'
require 'pathname'

require 'rack/protection'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require 'sinatra/reloader' if development?

require 'erb'

require 'sprockets'
require 'sprockets-helpers'
require 'uglifier'
require 'sass'
require 'execjs'

require 'rspec' if test?
require 'capybara/rspec' if test?
require 'capybara/poltergeist' if test?

ROOT_PATH = Pathname.new(File.expand_path('../../', __FILE__))

# Set up the controllers and helpers
Dir[ROOT_PATH.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[ROOT_PATH.join('app', 'helpers', '*.rb')].each { |file| require file }

# # Set up the database and models
require ROOT_PATH.join('config', 'database')
