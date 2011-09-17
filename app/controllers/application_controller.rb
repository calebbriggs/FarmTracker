class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate, :except => [:login]
  before_filter :fetch_logged_user
  def authenticate
     unless session[:user]
       redirect_to :login
     end
  end

  def login
    if params[:user] && session[:user] = User.authenticate(params[:user][:userName], params[:user][:password])
      flash[:message]  = "Login successful"
      redirect_to :home
    else
      flash[:warning] = "Login unsuccessful"
      render :template => 'index'
    end
  end

  def logout
    session.destroy()
    session.clear()
    flash[:message]  = "Logout successful"
    redirect_to(:login)
  end

  def fetch_logged_user
    unless session[:user].blank?
      @logged_user = User.find(session[:user].id)
    end
    rescue ActiveRecord::RecordNotFound
  end
end
