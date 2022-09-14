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
    redirect_to '/'
  end
  
  def show
    @tweets = Tweet.find(params[:id])
  end
  
  def edit
    @tweets = Tweet.find(params[:id])
  end
  
  def update
    tweets = Tweet.find(params[:id])
    tweets.update(message: params[:tweet][:message], tdate: params[:tweet][:tdate])
    redirect_to '/'
  end
end
