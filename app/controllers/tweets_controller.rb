class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweets = Tweet.new
  end
  
  def create
    if params[:tweet][:file] == nil
      render 'new'
      return
    end
    @tweets = Tweet.new(message: params[:tweet][:message], tdate: Time.current, file: params[:tweet][:file].read)
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
    if params[:tweet][:file] == nil
      redirect_to '/'
      return
    end
    tweets = Tweet.find(params[:id])
    tweets.update(message: params[:tweet][:message], tdate: tweets.tdate, file: params[:tweet][:file].read)
    redirect_to '/'
  end
  
  def get_image
    image = Tweet.find(params[:id])
    send_data image.file, disposition: :inline, type:'image/png'
  end
end
