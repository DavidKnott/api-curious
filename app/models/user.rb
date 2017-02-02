class User < ApplicationRecord

  def self.find_or_create_from(auth)
    user                = User.find_or_create_by(reddit_user_id: auth.uid)
    user.reddit_user_id = auth.uid
    user.token          = auth.credentials.token
    user.refresh_token  = auth.credentials.refresh_token
    user.username          = auth.info.name
    user.comment_karma  = auth.extra.raw_info.comment_karma
    user.save
    user
  end

  def refresh(auth)
    self.update(token: auth["access_token"])
  end

  def get_most_recent
    conn = Faraday.new 'https://oauth.reddit.com'
    raw_subreddits = conn.get do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['Authorization'] = "bearer #{self.token}"
      req.params['limit'] = "15"
    end
    attrs = JSON.parse(raw_subreddits.body, symbolize_names: true)[:data][:children]
    @posts = attrs.map do |attr|
      Post.new(attr[:data])
    end
  end
end