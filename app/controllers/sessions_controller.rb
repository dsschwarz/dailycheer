class SessionsController < ApplicationController

  def new
   if !signed_in?
    redirect_to '/home'
   end
  end
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to '/add'
    else
      flash.now[:error] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def destroy
  	logger.debug(self.current_user)
    self.current_user = nil
    cookies.delete(:dailycheer_token)
    logger.debug(self.current_user)
    redirect_to '/'

  end


end
