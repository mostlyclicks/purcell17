class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :load_clients


  protected

  	def load_clients
  		@clients = Refinery::Clients::Client.all
  	end

end
