require 'rubygems'
Gem.clear_paths

require 'sinatra'

get '/' do
  'Hello'
end

run Sinatra::Application
