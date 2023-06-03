# frozen_string_literal: true

# app.rb
require 'sinatra'
require_relative 'open_notify'
# hj: importing json module
require 'json'

# Allow our templates in views/ to end in `.html.erb`
Tilt.register Tilt::ERBTemplate, 'html.erb'

set :layout, 'views/layout.html.erb'

iss_now = OpenNotify.iss_now

get '/' do
  erb :index
end

get '/position' do
  # hj: moved iss_now as a global variable
  # iss_now = OpenNotify.iss_now

  erb :position, locals: { data: iss_now }
end

get '/astros' do
  astros = OpenNotify.astros

  erb :astros, locals: { data: astros }
end

# hj: passing in template content directly
get '/iss_position.json' do
  # hj: setting the response content type to JSON
  content_type :json

  # hj: calling .to_json method on the position data to convert it to JSON
  iss_now.to_json
end