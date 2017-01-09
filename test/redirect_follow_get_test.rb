require 'test_helper'

class RedirectFollowGetTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RedirectFollowGet::VERSION
  end

  def test_return_200_after_redirect
    r = redirect_follow_get("http://google.com/?q=test")
    assert_equal "200", r.code
  end

  def test_return_200_after_redirect_with_non_ascii
    r = redirect_follow_get("http://google.com/?q=テスト")
    assert_equal "200", r.code
  end
end
