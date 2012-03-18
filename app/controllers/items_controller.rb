class ItemsController < ApplicationController
  before_filter :set_admin_nav_flag
  before_filter :need_admin_login

  def index
    @items = Item.paginate(:page => params[:page], :per_page => 10, :order => "id desc")

    respond_to do |format|
      format.html
    end
  end

  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
    end
  end
  
  private
  def set_admin_nav_flag
    @admin_nav_flag = "items"
  end
end
