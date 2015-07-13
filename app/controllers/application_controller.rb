class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  	def params_filter
      return nil
  	end

    def id?(object=nil, notice='Invalid operation')
      if object
        return true
      else
        flash[:notice] = notice
        redirect_to(:controller => 'access', :action => 'index')
        return false
      end
    end

  	def logged_in?
  		unless session[:user_id]
  			flash[:notice] = 'You are not logged in'
  			redirect_to(:controller => 'access', :action => 'login')
  			return false
  		else
  			return true
  		end
  	end
end
