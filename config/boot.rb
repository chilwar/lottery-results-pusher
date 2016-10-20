$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'rubygems'
require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
Bundler.require(:default, :"#{ ENV['RAILS_ENV'] }")

require 'yaml'
require 'open-uri'

CONFIG = YAML.load_file(File.join(File.expand_path('..', __FILE__), 'config.yml'))

require 'lottery/results'

if ENV['RAILS_ENV'] != 'test'
  Rake.application.run
end