$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'yaml'
require 'open-uri'

CONFIG = YAML.load_file(File.join(File.expand_path('..', __FILE__), 'config.yml'))

require 'lottery/results'
Rake.application.run