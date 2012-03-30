#encoding: utf-8
class ChannelsController < ApplicationController
  before_filter :set_admin_nav_flag
  before_filter :need_admin_login
  
  def index
    @channels = Channel.paginate(:page => params[:page], :per_page => 20, :order => "id desc")
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @channel = Channel.find(params[:id])
  end

  def new
    @channel = Channel.new
    respond_to do |format|
      format.html
    end
  end

  def edit
    @channel = Channel.find(params[:id])
  end

  def create
    @channel = Channel.new(params[:channel])

    respond_to do |format|
      if @channel.save
        flash[:notice] = '添加成功'
        format.html { redirect_to @channel }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @channel = Channel.find(params[:id])

    respond_to do |format|
      if @channel.update_attributes(params[:channel])
        flash[:notice] = '编辑成功'
        format.html { redirect_to @channel }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy
    respond_to do |format|
      flash[:notice] = '删除成功'
      format.html { redirect_to(channels_url) }
    end
  end
  
  private
  
  def set_admin_nav_flag
    @admin_nav_flag = "channels"
  end
end