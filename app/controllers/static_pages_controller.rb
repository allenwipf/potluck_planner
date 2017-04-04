class StaticPagesController < ApplicationController
  def home
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def potluck_view
  end

  def potlucks
  end

  def users
  end
end
