class RedditService
  def self.get_posts_for(user)
    conn = Faraday.new 'https://oauth.reddit.com'
    raw_posts = conn.get do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['Authorization'] = "bearer #{user.token}"
      req.params['limit'] = "15"
    end
    byebug
    JSON.parse(raw_posts.body, symbolize_names: true)[:data][:children]
  end
end