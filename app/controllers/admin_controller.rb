class AdminController < ApplicationController

  layout 'public'

  before_filter :confirm_logged_in, except: [:login, :attempt_login, :logout]

  def index
    menu
    render('menu')
  end

  def menu


  end

  def login
    #login form
  end

  def attempt_login
    
    authorized_user = User.authenticate(params[:username],params[:password])
    
    puts "A user is trying to authenticate using username: #{params[:username]} and password: #{params[:password]}"
  
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "You are now logged in!"
      redirect_to(action: 'menu')
    else
      flash[:notice] = "Username and/or password incorrect"
      redirect_to(action: 'login')
    end


  end

  def logout
    session[:user_id] = nil
    session[:username] = nil 
 
    flash[:notice] = "You have been logged out"
    redirect_to(action: 'login')

  end


end
