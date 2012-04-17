class AreasController < ApplicationController
  before_filter :set_admin_nav_flag
  before_filter :need_admin_login

  # GET /areas
  # GET /areas.json
  def index
    @areas = Area.order("position asc")

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def articles
    @area  = Area.find(params[:id])
    @articles = @area.articles.paginate(:page => params[:page], :per_page => 20, :order => "id desc")
    respond_to do |format|
      format.html
    end
  end

  def archetypes
    @area  = Area.find(params[:id])
    @archetypes = @area.archetypes.paginate(:page => params[:page], :per_page => 20, :order => "id desc")
    respond_to do |format|
      format.html
    end
  end

  # GET /areas/1
  # GET /areas/1.json
  def show
    @area = Area.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /areas/new
  # GET /areas/new.json
  def new
    @area = Area.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /areas/1/edit
  def edit
    @area = Area.find(params[:id])
  end

  # POST /areas
  # POST /areas.json
  def create
    @area = Area.new(params[:area])

    respond_to do |format|
      if @area.save
        format.html { redirect_to archetypes_url, notice: 'Area was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /areas/1
  # PUT /areas/1.json
  def update
    @area = Area.find(params[:id])

    respond_to do |format|
      if @area.update_attributes(params[:area])
        format.html { redirect_to archetypes_url, notice: 'Area was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /areas/1
  # DELETE /areas/1.json
  def destroy
    @area = Area.find(params[:id])
    @area.destroy

    respond_to do |format|
      format.html { redirect_to archetypes_url }
    end
  end

  private
  
  def set_admin_nav_flag
    @admin_nav_flag = "areas"
  end
end
