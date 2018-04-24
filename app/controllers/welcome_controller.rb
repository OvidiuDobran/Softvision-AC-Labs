class WelcomeController < ApplicationController

	def new
		if session[:user_id]==nil
			redirect_to '/login'
		end
	end

	def create
		if session[:user_id]==nil
			redirect_to '/login'
		end
	end


	def authorize
		
  	end

  	def update
  		redirect_to "/currencies"
	end


end