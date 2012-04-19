#encoding: utf-8
class CouponsController < ApplicationController
  before_filter :set_admin_nav_flag
  before_filter :need_admin_login
  
  def index
    if params[:fromid].present? and params[:from] == "archetype"
      archetype = Archetype.find(params[:fromid])
      @coupons = archetype.coupons.paginate(:page => params[:page], :per_page => 20, :order => "id desc")
    else
      @coupons = Coupon.paginate(:page => params[:page], :per_page => 20, :order => "id desc")
    end
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @coupon = Coupon.find(params[:id])
  end

  def new
    @coupon = Coupon.new(:archetype_id => params[:fromid])
    respond_to do |format|
      format.html
    end
  end

  def edit
    @coupon = Coupon.find(params[:id])
  end

  def create
    @coupon = Coupon.new(params[:coupon])

    respond_to do |format|
      if @coupon.save
        flash[:notice] = '添加成功'
        format.html { redirect_to coupons_url(:from => "archetype", :fromid => @coupon.archetype_id) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @coupon = Coupon.find(params[:id])

    respond_to do |format|
      if @coupon.update_attributes(params[:coupon])
        flash[:notice] = '编辑成功'
        format.html { redirect_to coupons_url(:from => "archetype", :fromid => @coupon.archetype_id) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy
    respond_to do |format|
      flash[:notice] = '删除成功'
      format.html { redirect_to(coupons_url) }
    end
  end
  
  private
  
  def set_admin_nav_flag
    @admin_nav_flag = "coupons"
  end
end
