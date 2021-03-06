require 'test_helper'

class RedirectFollowGetTest < Minitest::Test
  URI_WITHOUT_REDIRECT = "https://github.com/"

  def test_return_200_without_redirect
    r = redirect_follow_get(URI_WITHOUT_REDIRECT)

    assert_equal "200", r.code
    assert_equal URI_WITHOUT_REDIRECT, r.uri.to_s
  end

  def test_fail_return_200_without_redirect
    assert_raises(RedirectFollowGet::TooManyRedirects) do
      redirect_follow_get(URI_WITHOUT_REDIRECT, limit: 0)
    end
  end

  def test_return_200_after_redirect
    r = redirect_follow_get("http://google.com/?q=test")
    assert_equal "200", r.code
  end

  def test_fail_return_200_after_redirect
    assert_raises(RedirectFollowGet::TooManyRedirects) do
      redirect_follow_get("http://google.com/?q=test", limit: 1)
    end
  end

  def test_return_200_after_redirect_with_non_ascii
    r = redirect_follow_get("http://google.com/?q=テスト")
    assert_equal "200", r.code
  end

  def test_fail_return_200_after_redirect_with_non_ascii
    assert_raises(RedirectFollowGet::TooManyRedirects) do
      redirect_follow_get("http://google.com/?q=テスト", limit: 1)
    end
  end

  def test_return_404
    r = redirect_follow_get(URI_WITHOUT_REDIRECT + "404-not-found-path")
    assert_equal "404", r.code
  end

  def test_return_200_with_query_param
    uri = "https://www.instagram.com/p/BPBe5kOABuk/?taken-by=instagram"
    r = redirect_follow_get(uri)
    assert_equal "200", r.code
  end

  def test_return_200_with_query_param2
    uri = "https://www.instagram.com/p/BPBe5kOABuk/?tagged=タグ"
    r = redirect_follow_get(uri)
    assert_equal "200", r.code
  end

  def test_non_ascii_url
    uri = "http://はじめよう.みんな/"
    r = redirect_follow_get(uri)
    assert_equal "200", r.code
    assert_equal "http://xn--p8j9a0d9c9a.xn--q9jyb4c/index.html", r.uri.to_s
  end
end
