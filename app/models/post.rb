class Post

  attr_reader :title, :subreddit_id, :num_comments

  def initialize(attrs = {})
    @title  = attrs[:title]
    @subreddit_id = attrs[:subreddit_id]
    @num_comments = attrs[:num_comments]
  end

  
end