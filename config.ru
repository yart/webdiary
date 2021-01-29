require 'sinatra'

get '/' do
  'Hello'
end

run Sinatra::Application
