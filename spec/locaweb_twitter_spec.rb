require "spec_helper"
require "locaweb_twitter"

RSpec.describe LocawebTwitter do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context 'Generics tests' do
    it "Has a version number" do
      expect(LocawebTwitter::VERSION).not_to be nil
    end

    it "Has response HTTP 200" do
      get "/"
      expect(last_response).to have_http_status(:success)
    end

    before(:each) do
      @factory_json = LocawebTwitter.new
      @parse_response_to_json = LocawebTwitter.new
    end

    it "Does use JSON valid?" do
      json_valid = @parse_response_to_json.json_valid?(JSON)

      expect(json_valid).to be true
    end

  end

  context 'Specific tests of application' do

    it 'Renders the index page' do
      get "/"
      last_response.body.should include("Teste")
    end

    it 'Renders the most mentions page' do
      get "/most_mentions"
      last_response.body.should include("Teste")
    end

    it "Is Locaweb id 42" do
      expect(id = 42).to eq(42)
    end

    it 'Send a Tweet' do
      params = Hash.new
      params[:id] = 2
      params[:user] = nil
      params[:retweets] = 10
      params[:likes] = 20
      params[:text] = "Hello Word"
      params[:date] = "Mon Sep 24 03:35:21 +0000 2012"
      expect{Tweet.new(params)}.to raise_error(ArgumentError, /Error - user nil/)
    end

    it "Have a valid api url?" do
      URL_API = "http://tweeps.locaweb.com.br/tweeps"
      expect(LocawebTwitter::URL_API).to eq "http://tweeps.locaweb.com.br/tweeps"
    end

  end
    
end