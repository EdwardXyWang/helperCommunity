class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_variables

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user


  def authorize
    redirect_to '/login' unless current_user
  end

  def show
    @event = Event.find(params[:id])
  end

  protected

  def set_variables
    @rooms = Room.all
  end

end
