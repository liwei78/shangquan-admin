#encoding: utf-8
class PagesController < ApplicationController
  before_filter :set_admin_nav_flag
  before_filter :need_admin_login
  
  def index
    @pages = Page.paginate(:page => params[:page], :per_page => 20, :order => "id desc")
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    respond_to do |format|
      format.html
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        flash[:notice] = '添加成功'
        format.html { redirect_to @page }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        flash[:notice] = '编辑成功'
        format.html { redirect_to @page }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    respond_to do |format|
      flash[:notice] = '删除成功'
      format.html { redirect_to(pages_url) }
    end
  end
  
  
  private
  
  def set_admin_nav_flag
    @admin_nav_flag = "pages"
  end
end
