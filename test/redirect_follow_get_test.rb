require 'test_helper'

class RedirectFollowGetTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RedirectFollowGet::VERSION
  end

  def test_return_200
    get "/"

    assert_equal "Hello", last_response.body
  end
end
