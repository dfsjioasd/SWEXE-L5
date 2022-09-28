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
      flash[:error] = @tweets.errors.full_messages
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
  
  def ifupdate(message, tdate, file)
    if @tweets.update(message: message, tdate: tdate, file: file)
        flash[:notice] = "更新しました"
        redirect_to root_path
    else
        flash[:error] = @tweets.errors.full_messages
        redirect_to edit_tweet_path
    end
  end
  
  def update
    @tweets = Tweet.find(params[:id])
    if params[:tweet][:file] == nil
      ifupdate(params[:tweet][:message], @tweets.tdate, nil)
    else
      ifupdate(params[:tweet][:message], @tweets.tdate, params[:tweet][:file].read)
    end
  end
  
  def get_image
    image = Tweet.find(params[:id])
    send_data image.file, disposition: :inline, type:'image/png'
  end
end
