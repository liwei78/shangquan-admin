#encoding: utf-8
class ScoresController < ApplicationController
  before_filter :set_admin_nav_flag
  before_filter :need_admin_login
  
  def index
    @scores = Score.order("id asc")
    respond_to do |format|
      format.html
    end
  end


  def update
    @score = Score.find(params[:id])

    respond_to do |format|
      if @score.update_attributes(params[:score])
        @done = true
        format.js
      else
        @done = false
        format.js
      end
    end
  end

  
  private
  
  def set_admin_nav_flag
    @admin_nav_flag = "users"
  end
end