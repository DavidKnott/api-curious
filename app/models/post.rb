class Post

  attr_reader :title, :subreddit_id, :num_comments

  def initialize(attrs = {})
    @title  = attrs[:title]
    @subreddit_id = attrs[:subreddit_id]
    @num_comments = attrs[:num_comments]
  end

  def self.get_most_recent_for(user)
    RedditService.get_most_recent_for(user).map do |attr|
      new(attr[:data])
    end
  end
end