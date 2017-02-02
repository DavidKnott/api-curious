class User < ApplicationRecord

  def self.find_or_create_from(auth)
    user                = User.find_or_create_by(reddit_user_id: auth.uid)
    user.reddit_user_id = auth.uid
    user.token          = auth.credentials.token
    user.refresh_token  = auth.credentials.token
    user.username          = auth.info.name
    user.comment_karma  = auth.extra.raw_info.comment_karma
    user.save
    user
  end
end