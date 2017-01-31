require 'json'
require 'net/http'
require 'tweet'
require 'user'

class LocawebTwitter
  
  attr_reader :tweets, :all_tweets

  # Initialize two empty arrays. One will be filled by users and other will be filled by tweets
  def initialize()
    @users_list = []
    @tweets = []
  end

  # Load url using Net:Http
  # Follow the tutorial: https://docs.ruby-lang.org/en/2.0.0/Net/HTTP.html
  def load_tweets_locaweb

    # Configure HTTP
    baseurl = "http://tweeps.locaweb.com.br"
    path    = "/tweeps"
    address = URI("#{baseurl}#{path}")
    request = Net::HTTP::Get.new address.request_uri

    # Request HTTP with Header of User
    http = Net::HTTP.new(address.host, address.port)
    request.initialize_http_header({ "Username" => "eltonaxl@hotmail.com" })
    http.start
    response = http.request(request)

    # Other mode
    # uri = URI(URL_API)
    # request = Net::HTTP::Get.new(uri)
    # request['Username'] = 'eltonaxl@hotmail.com'
    # response = Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(request) }

    # Testing if response is ok
    if response.code == '200' then
      @all_tweets = JSON.parse(response.body)
    else
      puts response.message
      puts "#{address.request_uri} => #{response.code}"
    end

  end

  # Get who tweet to Locaweb and reject itself (id: 42)
  def remove_tweets_in_reply_to_old_mentions!
    @all_tweets["statuses"].reject!{ |x| x["in_reply_to_user_id"] == 42 }
  end

  def convert_json_to_domain_objects
    @all_tweets["statuses"].each do |tweet_details|
      tweet_details["entities"]["user_mentions"].each do |item|
        if item["id"] == 42
          extracted_tweet = extract_tweet(tweet_details)
          @tweets << extracted_tweet
          user = extract_user(tweet_details["user"]) 
          extracted_tweet.user = user
          user.add_tweet(extracted_tweet)
          @users_list << user  if !@users_list.any? { |u| u.id == user.id }
        end
      end
    end
  end

  # Sort all tweets
  def all_tweets_sorted
    tweets_list = []
    top_users.each{|user| tweets_list.concat(user.sorted_tweets) }
    tweets_list
  end

  # Users who most followers
  def top_users
    @users_list.sort_by{ |u| u.followers }
  end

  private
  # Extract what need of tweet
  def extract_tweet(tweet_json)
    tweet = Tweet.new(tweet_json["id"],tweet_json["text"],tweet_json["retweet_count"],tweet_json["favorited"],tweet_json["created_at"])
    tweet
  end

  # Extract what need of user
  def extract_user(user_json)
    user = User.new(user_json["id"], user_json["screen_name"], user_json["followers_count"])
    user
  end

end