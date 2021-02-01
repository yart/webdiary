# frozen_string_literal: true

require 'sinatra'

# settings

set :haml, :format => :html5
set :views, 'app/views'

# routes

get '/' do
  @records = linkify Dir.children('records').sort { |a, b| b <=> a }
  haml :index, layout: :'layouts/layout'
end

get '/record/?' do
  redirect '/'
end

get '/record/:record' do |record|
  @date   = textify(record, :date)
  @record = Dir["records/#{record}*"].map { |file| timeify(clearify(File.read(file)), textify(file, :time)) } .reverse.join("\n")
  haml :record, layout: false
end

# stuff

helpers do
  helpers_dir = 'app/helpers/'
  Dir.children(helpers_dir).each { |file| load(helpers_dir + file) }
end
