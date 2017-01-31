# Autoload the server and add all files
$LOAD_PATH << File.expand_path(File.join('./', 'lib'), File.dirname(__FILE__))

require 'sinatra'
require 'locaweb_twitter'

def init
  locaweb_twitter = LocawebTwitter.new
  locaweb_twitter.load_tweets_locaweb
  locaweb_twitter.remove_tweets_in_reply_to_old_mentions!
  locaweb_twitter.convert_json_to_domain_objects

  @sorted_tweets = locaweb_twitter.all_tweets_sorted
  @top_users = locaweb_twitter.top_users
end

def main
  get '/' do
    init
    erb :most_relevants, layout: :index
  end

  get '/most_mentions' do
    init
    erb :most_mentions, layout: :index
  end
end

# Get the last return
main