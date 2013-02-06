class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  def session_exists
    logger.debug("SIGNED IN ? SDASDASDSDAADSAD ")
    logger.debug(signed_in?)
    if signed_in?

      redirect_to "/signin"
    end
  end
end
