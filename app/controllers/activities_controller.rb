class ActivitiesController < ApplicationController
  before_filter :set_admin_nav_flag
  before_filter :need_admin_login

  def index
    @activities = Activity.paginate(:page => params[:page], :per_page => 10, :order => "id desc")

    respond_to do |format|
      format.html
    end
  end

  def show
    @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @activity = Activity.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def create
    @activity = Activity.new(params[:activity])

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url }
    end
  end
  
  private
  def set_admin_nav_flag
    @admin_nav_flag = "activities"
  end
end
