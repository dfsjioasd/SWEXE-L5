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
      redirect_to '/'
    else
      render 'new'
    end
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
    if params[:tweet][:file] == nil
      tweets.update(message: params[:tweet][:message], tdate: Time.current, file: nil)
    else
      tweets.update(message: params[:tweet][:message], tdate: Time.current, file: params[:tweet][:file].read)
    end
    redirect_to '/'
  end
  
  def get_image
    image = Tweet.find(params[:id])
    send_data image.file, disposition: :inline, type:'image/png'
  end
end
