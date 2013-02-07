class PasswordchangeController < ApplicationController
	def change 
	
	end

	def changepw
		#Finds user by the email entered in the password change form 
		#then checks to see if the password entered == actual password 
		#changes the password if true 
		 @user = User.find_by_email(params[:session][:email])
	    if @user && @user.authenticate(params[:session][:c_password])
	      @user.password = params[:session][:password]
	      @user.password_confirmation = params[:session][:password_confirmation]
	      @user.password_change if @user

		  flash[:notice] = 'Password Changed' 
		  render 'change'

	    else
	      flash[:error] = 'Invalid password' 
	      render 'change'
	    end
	end
end
