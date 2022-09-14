class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweets = Tweet.new
  end
  
  def create
    tweets = Tweet.new(message: params[:tweet][:message], tdate: Time.current)
    tweets.save
    redirect_to '/'
  end
  
  def destroy
    tweets = Tweet.find(params[:id])
    tweets.destroy
    redirect_to
  end
end
