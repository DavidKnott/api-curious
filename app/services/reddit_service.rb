class RedditService
  def self.get_most_recent_for(user)
    conn = Faraday.new 'https://oauth.reddit.com'
    raw_posts = conn.get do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['Authorization'] = "bearer #{user.token}"
      req.params['limit'] = "15"
    end
    JSON.parse(raw_posts.body, symbolize_names: true)[:data][:children]
  end
end