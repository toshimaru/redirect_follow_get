# frozen_string_literal: true
require 'redirect_follow_get/version'
require 'addressable'
require 'net/http'

module RedirectFollowGet
  class TooManyRedirects < StandardError; end

  def self.parse_url(url)
    url = Addressable::URI.encode(url) unless url.ascii_only?
    URI.parse(url)
  end
end

def redirect_follow_get(url, limit: 10)
  raise RedirectFollowGet::TooManyRedirects, 'too many HTTP redirects' if limit.zero?

  uri = RedirectFollowGet.parse_url(url)

  case response = Net::HTTP.get_response(uri)
  when Net::HTTPSuccess
    response
  when Net::HTTPRedirection
    location = response['location']
    redirect_follow_get(location, limit: limit - 1)
  else
    response
  end
end
