class Post

  attr_reader :title, 
              :subreddit_id, 
              :num_comments,
              :subreddit,
              :permalink,
              :url,
              :score

  def initialize(attrs = {})
    @title        = attrs[:title]
    @subreddit_id = attrs[:subreddit_id]
    @num_comments = attrs[:num_comments]
    @subreddit    = attrs[:subreddit]
    @permalink    = attrs[:permalink]
    @url          = attrs[:url]
    @score        = attrs[:score]
  end

  def self.get_posts_for(user)
    RedditService.get_posts_for(user).map do |attr|
      new(attr[:data])
    end
  end
end