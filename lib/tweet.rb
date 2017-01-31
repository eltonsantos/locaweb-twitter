class Tweet

  attr_reader :id, :user, :content, :retweet_count, :favorited, :created_at

  # Initialize tweet attributes
  def initialize(id, content, retweet_count, favorited, created_at)
    @id = id
    @content = content
    @retweet_count = retweet_count
    @favorited = favorited
    @created_at = created_at
  end

  def user=(user)
    @user = user
  end

end