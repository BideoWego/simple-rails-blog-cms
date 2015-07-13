class AccessController < BackendController
	skip_before_action :logged_in?, :except => [:index]

  def index
  end

  def login
  end

  def do_login
  	if params[:username].present? && params[:password].present?
  		user = Author.where(:username => params[:username]).first
  		if user
  			user = user.authenticate(params[:password])
  		end
  	end
  	if user
  		session[:user_id] = user.id
  		session[:username] = user.username
  		flash[:notice] = "Logged in"
  		redirect_to( :action => 'index')
  	else
  		flash[:alert] = 'Invalid username or password'
  		redirect_to(:action => 'login')
  	end
  end

  def logout
  	session[:user_id] = nil
  	session[:username] = nil
  	flash[:notice] = "Logged out"
  	redirect_to(:action => 'login')
  end
end
