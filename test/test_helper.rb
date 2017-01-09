require 'pry'

require 'simplecov'
SimpleCov.start

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'redirect_follow_get'

require 'minitest/autorun'
