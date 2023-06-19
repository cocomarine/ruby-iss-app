# frozen_string_literal: true

require './app.rb'
require 'rack/test'

RSpec.describe 'App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  # let(:mock_iss_data) do
  #   {
  #     "iss_position": { "longitude": "-3.4941", "latitude": "-37.5113" },
  #     "timestamp": 1684502291,
  #     "message": "success"
  #   }
  # end

  before(:each) do
    allow(OpenNotify).to receive(:iss_now) do
      {
        "iss_position": { "longitude": "-3.4941", "latitude": "-37.5113" },
        "timestamp": 1684502291,
        "message": "success"
      }
    end
  end
  # before(:each) do
  #   allow(OpenNotify).to.receive(:iss_now).and_return(mock_iss_data)
  # end

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
      # print(last_response)
      # print last_response.status
      expect(last_response.body).to include("Where is the ISS?")
      expect(last_response.body).to include("The location of the ISS is longitude -3.4941 and latitude -37.5113")
    end
  end

  describe 'GET /astros' do
    it 'renders the astros template' do
      get '/astros'
      expect(last_response).to be_ok
      expect(last_response.body).to include("Who are in space right now?")
    end
  end

  describe 'GET /astros' do
    it 'renders the astros template' do
      get '/astros'
      expect(last_response).to be_ok
      expect(last_response.body).to include("Who are in space right now?")
    end
  end
  describe 'GET /iss_position.json' do
    it 'return the ISS position data as JSON' do
      get '/iss_position.json'
      expect(last_response).to be_ok

      # testing content type
      expect(last_response.content_type).to eq('application/json')

      json_response = JSON.parse(last_response.body)
      expect(json_response).to include("iss_position")
      expect(json_response["iss_position"]).to include("longitude", "latitude")
      expect(json_response["iss_position"]["longitude"]).to eq("-3.4941")
      expect(json_response["iss_position"]["latitude"]).to eq("-37.5113")
      
      expect(json_response).to include("timestamp", "message")
      expect(json_response["timestamp"]).to eq(1684502291)
      expect(json_response["message"]).to eq("success")
    end
  end
end