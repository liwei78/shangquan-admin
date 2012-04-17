class CategoriesController < ApplicationController
  before_filter :set_admin_nav_flag
  before_filter :need_admin_login

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.order("position")

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def articles
    @category  = Category.find(params[:id])
    @articles = @category.articles.paginate(:page => params[:page], :per_page => 20, :order => "id desc")
    respond_to do |format|
      format.html
    end
  end

  def archetypes
    @category  = Category.find(params[:id])
    @archetypes = @category.archetypes.paginate(:page => params[:page], :per_page => 20, :order => "id desc")
    respond_to do |format|
      format.html
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to archetypes_url, notice: 'Category was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to archetypes_url, notice: 'Category was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to archetypes_url }
    end
  end

  private
  
  def set_admin_nav_flag
    @admin_nav_flag = "categories"
  end
end
