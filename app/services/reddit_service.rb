class RedditService
  def self.get_posts_for(user)
    conn = Faraday.new 'https://oauth.reddit.com'
    raw_posts = conn.get do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['Authorization'] = "bearer #{user.token}"
      req.params['limit'] = "15"
    end
    JSON.parse(raw_posts.body, symbolize_names: true)[:data][:children]
  end

  def self.get_comments_for(link, user)
    conn = Faraday.new "https://oauth.reddit.com#{link}"
    raw_posts = conn.get do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['Authorization'] = "bearer #{user.token}"
      req.params['depth'] = "10"
      req.params['limit'] = "500"
      # req.params['sort'] = "new"
    end
    attr = JSON.parse(raw_posts.body, symbolize_names: true)
  end
  

end