class User < ApplicationRecord

  def self.find_or_create_from(auth)
    user                = User.find_by_or_create(reddit_user_id: auth.uid)
    user.reddit_user_id = auth.uid
    user.token          = auth.credentials.token
    user.refresh_token  = auth.credentials.token
    user.name           = auth.info.name
    user.comment_karma  = auth.extra.raw_info.comment_karma
    user.save
  end
end