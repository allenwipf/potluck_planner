class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_filter :load_current_user
  before_filter :load_new_user

  def load_new_user
    if @current_user.nil?
      @current_user = User.new
    end
  end

  def load_current_user

    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end
