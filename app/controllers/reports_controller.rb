class ReportsController < ApplicationController
  before_filter :set_admin_nav_flag
  before_filter :need_admin_login

  def index
    @reports = Report.paginate(:page => params[:page], :per_page => 10, :order => "id desc")

    respond_to do |format|
      format.html
    end
  end

  def channels
    @reports = Report.paginate(:conditions => "channel_id is not null", :page => params[:page], :per_page => 10, :order => "id desc")

    respond_to do |format|
      format.html {render :template => "reports/index"}
    end
  end

  def areas
    @reports = Report.paginate(:conditions => "area_id is not null", :page => params[:page], :per_page => 10, :order => "id desc")

    respond_to do |format|
      format.html {render :template => "reports/index"}
    end
  end

  def categories
    @reports = Report.paginate(:conditions => "category_id is not null", :page => params[:page], :per_page => 10, :order => "id desc")

    respond_to do |format|
      format.html {render :template => "reports/index"}
    end
  end


  def show
    @report = Report.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @report = Report.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def create
    @report = Report.new(params[:report])

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @report = Report.find(params[:id])

    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url }
    end
  end
  
  private
  def set_admin_nav_flag
    @admin_nav_flag = "reports"
  end
end
