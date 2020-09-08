require 'twitter_factory'

class TweetsController < ApplicationController
  include TwitterFactory

  before_action :authenticate_user!
  before_action :set_user, only: [:index]
  
  def index
    redirect_to '/' if !current_user

    # Create the REST client and make API calls on behalf of the logged in user
    twitter_rest_client = TwitterFactory.new_rest_client( current_user[:access_token], current_user[:secret_token] )
    twitter_streaming_client = TwitterFactory.new_streaming_client

    @main_timeline = twitter_rest_client.user_timeline

    # Fetch tweet objects and map onto our slimmed-down, validated version of the tweet
    @tweets = twitter_rest_client.user_timeline

    respond_to do |format|
      format.html
      format.json { render json: @tweets }
    end
  end

  private

    def set_user
      @user = current_user
    end

end
