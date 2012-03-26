#encoding: utf-8
class BannersController < ApplicationController
  before_filter :set_admin_nav_flag
  before_filter :need_admin_login

  def index
    @banners = Banner.paginate(:page => params[:page], :per_page => 10, :order => "id desc")

    respond_to do |format|
      format.html
    end
  end

  def show
    @banner = Banner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @banner = Banner.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @banner = Banner.find(params[:id])
  end

  def create
    @banner = Banner.new(params[:banner])

    respond_to do |format|
      if @banner.save
        format.html { redirect_to @banner, notice: 'Banner was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @banner = Banner.find(params[:id])

    respond_to do |format|
      if @banner.update_attributes(params[:banner])
        format.html { redirect_to @banner, notice: 'Banner was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy

    respond_to do |format|
      format.html { redirect_to banners_url }
    end
  end
  
  private
  def set_admin_nav_flag
    @admin_nav_flag = "banners"
  end
end
