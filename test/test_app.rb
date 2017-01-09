require "sinatra"

class TestApp < Sinatra::Base
  get "/" do
    "Hello, GET: #{params.inspect}"
  end
end
