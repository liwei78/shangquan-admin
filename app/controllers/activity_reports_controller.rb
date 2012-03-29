class ActivityReportsController < ApplicationController
  before_filter :set_admin_nav_flag
  before_filter :need_admin_login

  def index
    @activity_reports = ActivityReport.paginate(:page => params[:page], :per_page => 10, :order => "id desc")

    respond_to do |format|
      format.html
    end
  end

  def show
    @activity_report = ActivityReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @activity_report = ActivityReport.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @activity_report = ActivityReport.find(params[:id])
  end

  def create
    @activity_report = ActivityReport.new(params[:activity_report])

    respond_to do |format|
      if @activity_report.save
        format.html { redirect_to @activity_report, notice: 'ActivityReport was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @activity_report = ActivityReport.find(params[:id])

    respond_to do |format|
      if @activity_report.update_attributes(params[:activity_report])
        format.html { redirect_to @activity_report, notice: 'ActivityReport was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @activity_report = ActivityReport.find(params[:id])
    @activity_report.destroy

    respond_to do |format|
      format.html { redirect_to activities_url }
    end
  end
  
  private
  def set_admin_nav_flag
    @admin_nav_flag = "activity_report_reports"
  end
end
