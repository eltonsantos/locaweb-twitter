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

      expect(last_response.body).to eq("")
      expect(last_response.status).to eq 200
    end

    it "Does use JSON" do
      should respond_with_content_type(:json)
    end

  end

  context 'Specific tests of application' do
    it 'Is a valid username' do
      expect(LocawebTwitter.new('http://tweeps.locaweb.com.br/', { headers: { username: 'eltonaxl@hotmail.com' } }).connect).to have_requested(:get, "http://tweeps.locaweb.com.br/").with(headers: { 'Username' => 'eltonaxl@hotmail.com' })
    end

    it 'Renders the index page' do
      get '/'
      expect(last_response.body).to eq(true)
    end

    it 'Renders the most mentions page' do
      get '/most_mentions'
      expect(last_response.body).to be_ok
    end

    it "Is Locaweb id 42" do
      expect(id = 42).to eq(42)
    end

  end
    
end