class ApplicationController < ActionController::Base
  protect_from_forgery width: :exception
  before_action :authenticate_user!
end
