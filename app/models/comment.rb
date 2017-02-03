class Comment

  attr_reader   :content, 
                :author,
                :score

  attr_accessor :comments

  def initialize(attrs = {})
    @content  = attrs[:body]
    @author   = attrs[:author]
    @score    = attrs[:score]
    @comments = nil
  end

  def to_partial_path
    'comment'
  end

  def self.get_post_and_comments_for(link, user)
    raw_comments = RedditService.get_comments_for(link, user)
    post = Post.new(raw_comments.first[:data][:children].first[:data])
    comments = raw_comments.last[:data][:children].map do |raw_comment|
      Comment.get_replies(raw_comment)
    end
    return post, comments
  end

  def self.get_replies(raw_comment)
    if raw_comment[:data][:body]
      raw_comment = raw_comment[:data]
      comment = new(raw_comment)
    end
    if raw_comment[:replies].present?
      raw_sub_comments = raw_comment[:replies][:data][:children]
      comment.comments = raw_sub_comments.map do |raw_sub_comment|
        get_replies(raw_sub_comment)
      end
    end
    comment
  end

end