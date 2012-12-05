class UsersController < ApplicationController
  	def new
		@user = User.new
  	end

  	def show
  		@user = User.find(params[:id])
  	end

	def create
    	@user = User.new(params[:user])
		self.country
   		if @user.save
      		redirect_to @user    	
      	else
      		render 'new'
    	end
    end

	def country
		["AB","BC","MB","NB","NL","NT","NS","NU","PE","SK","ON","QC","YT"].each do |i|
			if i==@user.state
				@user.country="CA"
				break
			 		else @user.country = "US"
			 		end
		end
	end
end

