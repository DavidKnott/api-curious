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

  def self.get_posts_and_rules_for(user, subreddit_link)
    posts = RedditService.get_posts_for(user, subreddit_link).map do |attr|
      new(attr[:data])
    end
    rules = RedditService.get_rules_for(user, subreddit_link)[:rules].map do |attr|
      Rule.new(attr)
    end
    return posts, rules
    end

end