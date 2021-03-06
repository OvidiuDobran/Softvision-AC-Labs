class SessionsController < ApplicationController

	def new
		if session[:user_id]!=nil
			redirect_to '/welcome'
		end
	end

	def create
		user=User.find_by(name: params[:name])
		if user && user.authenticate(params[:password])
			session[:user_id]=user.id
			redirect_to '/welcome'
		else
			redirect_to '/login', alert: 'Invalid user'

		end

	end

	def destroy
		session[:user_id]=nil
		redirect_to '/login'

	end

	
end