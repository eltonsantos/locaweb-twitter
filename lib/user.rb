class User

  attr_reader :id, :screen_name, :followers, :tweets

  # Initialize user attributes
  def initialize(id, screen_name, followers)
    @id = id
    @screen_name = screen_name
    @followers = followers
    @tweets = []
  end

  # Add tweet on array
  def add_tweet(tweet)
    @tweets << tweet
  end

  # Sort tweets of user
  def sorted_tweets
    tweets_list = most_retweeted.concat(favorited_tweets).concat(others_tweets)
    tweets_list
  end

  private
 
  # Tweets most retweeted
  def most_retweeted 
    @tweets.reject{|x| x.retweet_count == 0}.sort_by{|x| x.retweet_count}.reverse
  end

  # Favorited tweets
  def favorited_tweets 
    @tweets.reject{|x| !x.favorited || (x.retweet_count > 0 && x.favorited)}.sort_by{|x| x.retweet_count}.reverse
  end

  def others_tweets
    @tweets.reject{|x| x.favorited || x.retweet_count > 0}
  end

end