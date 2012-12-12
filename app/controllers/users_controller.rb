class UsersController < ApplicationController
    before_filter :signed_in_user, only: [:edit, :update]
    before_filter :correct_user,   only: [:edit, :update]

    
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
        flash[:success] = "WELCOME #{@user.first_name}!"
   			sign_in @user
      		redirect_to @user    	
      	else
      		render 'new'
    	end
    end

    def edit
    end

    def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user    
    else
      render 'edit'
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

