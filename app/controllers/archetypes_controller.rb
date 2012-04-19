class ArchetypesController < ApplicationController
  before_filter :set_admin_nav_flag
  before_filter :need_admin_login

  # GET /Archetypes
  # GET /Archetypes.json
  def index
    @archetypes = Archetype.paginate(:page => params[:page], :per_page => 20, :order => "position asc")

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @archetype = Archetype.find(params[:id])
  end

  # GET /Archetypes/new
  # GET /Archetypes/new.json
  def new
    @archetype = Archetype.new
    @archetype.category_id = params[:fromid] if params[:from] == "categories"
    @archetype.channel_id  = params[:fromid] if params[:from] == "channels"
    @archetype.area_id     = params[:fromid] if params[:from] == "areas"
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /Archetypes/1/edit
  def edit
    @archetype = Archetype.find(params[:id])
  end

  # POST /Archetypes
  # POST /Archetypes.json
  def create
    @archetype = Archetype.new(params[:archetype])

    respond_to do |format|
      if @archetype.save
        if params[:from].present?
          backto = url_for(:controller => params[:from], :action => "archetypes", :id => params[:fromid])
        else
          backto = archetypes_url
        end
        format.html { redirect_to backto, notice: 'Archetype was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /Archetypes/1
  # PUT /Archetypes/1.json
  def update
    @archetype = Archetype.find(params[:id])

    respond_to do |format|
      if @archetype.update_attributes(params[:archetype])
        if params[:from].present?
          backto = url_for(:controller => params[:from], :action => "archetypes", :id => params[:fromid])
        else
          backto = archetypes_url
        end
        format.html { redirect_to backto, notice: 'Archetype was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /Archetypes/1
  # DELETE /Archetypes/1.json
  def destroy
    @archetype = Archetype.find(params[:id])
    @archetype.destroy

    respond_to do |format|
      format.html { redirect_to archetypes_url }
    end
  end

  private

  def set_admin_nav_flag
    @admin_nav_flag = params["from"]
  end
end
