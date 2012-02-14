class GoodsController < ApplicationController
  before_filter :set_admin_nav_flag
  before_filter :need_admin_login

  def index
    @goods = Good.paginate(:page => params[:page], :per_page => 10, :order => "id desc")

    respond_to do |format|
      format.html
    end
  end

  def show
    @good = Good.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @good = Good.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @good = Good.find(params[:id])
  end

  def create
    @good = Good.new(params[:good])

    respond_to do |format|
      if @good.save
        format.html { redirect_to @good, notice: 'Good was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @good = Good.find(params[:id])

    respond_to do |format|
      if @good.update_attributes(params[:good])
        format.html { redirect_to @good, notice: 'Good was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @good = Good.find(params[:id])
    @good.destroy

    respond_to do |format|
      format.html { redirect_to goods_url }
    end
  end
  
  private
  def set_admin_nav_flag
    @admin_nav_flag = "goods"
  end
end
