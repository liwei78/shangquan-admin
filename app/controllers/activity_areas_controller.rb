class ActivityAreasController < ApplicationController

  def index
    @activity_areas = ActivityArea.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @activity_area = ActivityArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity_area }
    end
  end

  def edit
    @activity_area = ActivityArea.find(params[:id])
  end

  def create
    @activity_area = ActivityArea.new(params[:activity_area])

    respond_to do |format|
      if @activity_area.save
        format.html { redirect_to activities_url, notice: 'Activity area was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @activity_area = ActivityArea.find(params[:id])

    respond_to do |format|
      if @activity_area.update_attributes(params[:activity_area])
        format.html { redirect_to activities_url, notice: 'Activity area was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @activity_area = ActivityArea.find(params[:id])
    @activity_area.destroy

    respond_to do |format|
      format.html { redirect_to activities_url }
      format.json { head :ok }
    end
  end
end
