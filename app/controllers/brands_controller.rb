#encoding: utf-8
class BrandsController < ApplicationController
  before_filter :set_admin_nav_flag
  before_filter :need_admin_login
  
  def index
    @brands = Brand.paginate(:page => params[:page], :per_page => 20, :order => "id desc")
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @brand = Brand.find(params[:id])
  end

  def new
    @brand = Brand.new(:brand_type => "brand")
    respond_to do |format|
      format.html
    end
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def create
    @brand = Brand.new(params[:brand])

    respond_to do |format|
      if @brand.save
        unless params[:user_id].blank?
          users = User.find(params[:user_id])
          @brand.users = users
        end
        flash[:notice] = '添加成功'
        format.html { redirect_to @brand }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @brand = Brand.find(params[:id])

    respond_to do |format|
      if @brand.update_attributes(params[:brand])
        unless params[:user_id].blank?
          users = User.find(params[:user_id])
          @brand.users = users
        end
        flash[:notice] = '编辑成功'
        format.html { redirect_to @brand }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    respond_to do |format|
      flash[:notice] = '删除成功'
      format.html { redirect_to(brands_url) }
    end
  end
  
  def del_pic
    brand = Brand.find(params[:id])
    photo = brand.photos.find(params[:pid])
    photo.destroy
    redirect_to :back
  end
  
  private
  
  def set_admin_nav_flag
    @admin_nav_flag = "brands"
  end
end