require "spec_helper"
require "locaweb_twitter"

OUTER_APP = Rack::Builder.parse_file('config.ru').first

RSpec.describe LocawebTwitter do
  include Rack::Test::Methods

  def app
    OUTER_APP
  end

  context 'Generics tests' do

    it "Has a version number" do
      expect(LocawebTwitter::VERSION).not_to be nil
    end

    it "Has response HTTP 200" do
      get "/"
      expect(last_response.status).to be 200
      expect(last_response.ok?).to be true
      # puts last_response.inspect
      # expect(last_response).to have_http_status(:success)
    end

    it "Does use JSON valid" do
      get '/'
      expect(last_response.status).to be 200
      expect(last_response.ok?).to be true
      # assert_equal 'Hello World', last_response.body
    end

    it "Have a valid api url?" do
      URL_API = "http://tweeps.locaweb.com.br/tweeps"
      expect(LocawebTwitter::URL_API).to eq "http://tweeps.locaweb.com.br/tweeps"
    end

  end

  context 'Specific tests of application' do

    it 'Renders the index page' do
      get "/"
      expect(last_response.status).to be 200
      expect(last_response.ok?).to be true
    end

    it 'Renders the most mentions page' do
    end

    it "returns status 404" do
      post "/"
      expect(last_response.status).to eq 404
    end

    it "Is Locaweb id 42" do
      expect(id = 42).to eq(42)
    end

    it 'Send a Tweet' do
    end

  end

end
