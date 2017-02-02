Rails.application.config.middleware.use OmniAuth::Builder do
  provider :reddit, ENV["REDDIT_KEY"], ENV["REDDIT_SECRET"], 
    {
      :scope => "identity,mysubreddits,read,submit",
      :duration => "permanent"
    }
end

