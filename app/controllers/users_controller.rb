class UsersController < ApplicationController
  def new
    @users = User.new
  end
  
  def create
    @user = User.new(uid: params[:user][:uid], pass: BCrypt::Password.create(params[:user][:pass]))
    if @user.save
      flash[:notice] = "ツイートしました"
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages
      render new_tweet_path
    end
  end
  def login
    if a = User.find_by(uid: params[:uid])
        if BCrypt::Password.new(a.pass) == params[:pass]
            session[:login_uid] = params[:uid]
            redirect_to root_path
        else
            render "error"
        end
    else
        render "error"
    end
  end
end