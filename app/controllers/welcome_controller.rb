class WelcomeController < ApplicationController

	def new
		if session[:user_id]==nil
			redirect_to '/login'
		end
	end

	def create

	end


	def authorize
		
  	end


end