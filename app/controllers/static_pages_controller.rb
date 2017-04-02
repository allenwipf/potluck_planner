class StaticPagesController < ApplicationController
  def home
  	@potluck = Potluck.find(1)
  end

  def potluck_view
  end

  def potlucks
  end

  def users
  end
end
