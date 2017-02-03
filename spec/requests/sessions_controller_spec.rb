require 'rails_helper'

describe SessionsController do
  before do
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:reddit]
    # request.env["omniauth.auth"] = OmniAuth.config.mock_auth 
    
  end

  describe "#create" do
    it "should succesfully create a user" do
      expect {
      get "/auth/reddit/callback"
      }.to change{ User.count }.by(1)
    end

    it "should succesfully create a session" do
      # session[:user_id].should be_nil
      get "/auth/reddit/callback"
      session[:user_id].should_not be_nil
    end
  end
end