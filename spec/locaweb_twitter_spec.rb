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
      puts last_response.inspect
      expect(last_response).to have_http_status(:success)
    end

    it "Does use JSON valid" do
      get '/'
      assert last_response.ok?
      assert_equal 'Hello World', last_response.body
    end

    it "Have a valid api url?" do
      URL_API = "http://tweeps.locaweb.com.br/tweeps"
      expect(LocawebTwitter::URL_API).to eq "http://tweeps.locaweb.com.br/tweeps"
    end

  end

  context 'Specific tests of application' do

    it 'Renders the index page' do
      get "/"
      last_response.should be_ok
    end

    it 'Renders the most mentions page' do
    end

    it "Is Locaweb id 42" do
      expect(id = 42).to eq(42)
    end

    it 'Send a Tweet' do
    end

  end
    
end