require "sinatra"

class TestApp < Sinatra::Base
  get "/" do
    "Hello"
  end
end
