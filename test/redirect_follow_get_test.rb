require 'test_helper'
require 'test_app'
require 'rack/test'

class RedirectFollowGetTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_that_it_has_a_version_number
    refute_nil ::RedirectFollowGet::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
