class ActivityCategoriesController < ApplicationController

  def index
    @activity_categories = ActivityCategory.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @activity_category = ActivityCategory.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @activity_category = ActivityCategory.find(params[:id])
  end

  def create
    @activity_category = ActivityCategory.new(params[:activity_category])

    respond_to do |format|
      if @activity_category.save
        format.html { redirect_to activities_url, notice: 'Activity category was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @activity_category = ActivityCategory.find(params[:id])

    respond_to do |format|
      if @activity_category.update_attributes(params[:activity_category])
        format.html { redirect_to activities_url, notice: 'Activity category was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @activity_category = ActivityCategory.find(params[:id])
    @activity_category.destroy

    respond_to do |format|
      format.html { redirect_to activities_url }
      format.json { head :ok }
    end
  end
end
