class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweets = Tweet.new
  end
  
  def create
    if params[:tweet][:file] == nil
      @tweets = Tweet.new(message: params[:tweet][:message], tdate: Time.current, file: nil)
    else
      @tweets = Tweet.new(message: params[:tweet][:message], tdate: Time.current, file: params[:tweet][:file].read)
    end
    if @tweets.save
      flash[:notice] = "ツイートしました"
      redirect_to root_path
    else
      render new_tweet_path
    end
  end
  
  def destroy
    tweets = Tweet.find(params[:id])
    tweets.destroy
    redirect_to root_path
  end
  
  def show
    @tweets = Tweet.find(params[:id])
  end
  
  def edit
    @tweets = Tweet.find(params[:id])
  end
  
  def update
    @tweets = Tweet.find(params[:id])
    if params[:tweet][:file] == nil
      if @tweets.update(message: params[:tweet][:message], tdate: @tweets.tdate, file: nil)
        redirect_to root_path
      else
        redirect_to edit_tweet_path
      end
    else
      if @tweets.update(message: params[:tweet][:message], tdate: @tweets.tdate, file: params[:tweet][:file].read)
        redirect_to root_path
      else
        redirect_to edit_tweet_path
      end
    end
  end
  
  def get_image
    image = Tweet.find(params[:id])
    send_data image.file, disposition: :inline, type:'image/png'
  end
end
