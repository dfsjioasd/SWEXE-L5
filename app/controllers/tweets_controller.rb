class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweets = Tweet.new
  end
  
  def create
    tweets = Tweet.new(title: params[:tweet][:message], tdate: Time.current)
    tweets.save
    redirect_to '/'
  end
end
