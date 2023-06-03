require './app.rb'
require 'rack/test'

RSpec.describe 'App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe 'GET /' do
    it 'returns index page' do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to include("RPF software engineer apprentice challenge")
      expect(last_response.body).to include("Where is the ISS?")
      expect(last_response.body).to include("Who are in space right now?")
    end
  end

  describe 'GET /position' do
    it 'renders the position template' do
      get '/position'
      expect(last_response).to be_ok
      expect(last_response.body).to include("Where is the ISS?")
    end
  end

  describe 'GET /astros' do
    it 'renders the astros template' do
      get '/astros'
      expect(last_response).to be_ok
      expect(last_response.body).to include("Who are in space right now?")
    end
  end
end