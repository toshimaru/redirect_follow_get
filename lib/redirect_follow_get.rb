require 'redirect_follow_get/version'
require 'net/http'

module RedirectFollowGet
  class TooManyRedirects < StandardError; end
end

def redirect_follow_get(url, limit: 10)
  raise RedirectFollowGet::TooManyRedirects, 'too many HTTP redirects' if limit.zero?

  case response = Net::HTTP.get_response(URI(url))
  when Net::HTTPSuccess
    response
  when Net::HTTPRedirection
    location = response['location']
    redirect_follow_get(location, limit: limit - 1)
  else
    response
  end
end
