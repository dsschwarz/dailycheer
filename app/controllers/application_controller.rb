class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  def session_exists
    if !signed_in?
      redirect_to "/signin"
    end
  end
end
