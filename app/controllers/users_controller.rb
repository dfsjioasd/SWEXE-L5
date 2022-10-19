class UsersController < ApplicationController
  def new
    @users = User.new
  end
  
  def create
    @users = User.new
    if User.find_by(uid: params[:user][:uid])
      render new_user_path
      return
    end
    @user = User.new(uid: params[:user][:uid], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
    if @user.save
      flash[:notice] = "登録しました"
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages
      render new_user_path
    end
  end
  
  def login
    if a = User.find_by(uid: params[:uid])
        if BCrypt::Password.new(a.pass) == params[:pass]
            session[:login_uid] = params[:uid]
            redirect_to root_path
        else
            render users_login_path
        end
    else
        render users_login_path
    end
  end
  
  def show
    render "login"
  end
end