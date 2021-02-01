# frozen_string_literal: true

require 'sinatra'

set :haml, :format => :html5
set :views, 'app/views'

get '/' do
  @records = linkify Dir.children('records').sort
  haml :index, layout: :'layouts/layout'
end

get '/record/?' do
  redirect '/'
end

get '/record/:record' do |record|
  @datetime = textify record
  @record   = clearify File.read('records/' + record + '.md')
  haml :record, layout: false
end

helpers do
  def linkify(list)
    list.map do |el|
      text = textify(el)
      "%a{href: '/record/#{el.gsub(%r{\.md}, '')}'} #{text}"
    end
  end
  
  def textify(number)
    number.gsub(%r{(?<year>\d{4})(?<month>\d{2})(?<day>\d{2})(?<hour>\d{2})(?<minute>\d{2})(\.md)?}, '\k<year>-\k<month>-\k<day> \k<hour>:\k<minute>')
  end
  
  def clearify(text)
    text.gsub(%r{^(.+-//-\n\n)(.+)}m, '\2')
  end
end
