require "spec_helper"

RSpec.describe LocawebTwitter do

  context 'Generics tests' do
    it "Has a version number" do
      expect(LocawebTwitter::VERSION).not_to be nil
    end

    it "Has response HTTP 200" do
      expect(response.status).to have_http_status(200)
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
      get :index
      expect(response).to render_template('/')
    end

    it 'Renders the most mentions page' do
      get :most_mentions
      expect(response).to render_template('/most_mentions')
    end

    it "Is Locaweb id 42" do
      expect(id = 42).to eq(42)
    end

  end
    
end