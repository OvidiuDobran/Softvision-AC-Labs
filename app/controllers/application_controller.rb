class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
  	@current_user ||=User.find session[:user_id] if session[:user_id]
  end

  helper_method :current_user

  def authorize
=begin
  	redirect_to '/login' unless current_user
=end
  end



  def create
  	user=User.find_by(name: params[:name])
		if user && user.authenticate(params[:password])
			session[:user_id]=user.id
			redirect_to '/welcome'

		end
	end

end
