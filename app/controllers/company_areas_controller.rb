class CompanyAreasController < ApplicationController
  def index
    @company_areas = CompanyArea.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @company_area = CompanyArea.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @company_area = CompanyArea.find(params[:id])
  end

  def create
    @company_area = CompanyArea.new(params[:company_area])

    respond_to do |format|
      if @company_area.save
        format.html { redirect_to companies_url, notice: 'Company area was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @company_area = CompanyArea.find(params[:id])

    respond_to do |format|
      if @company_area.update_attributes(params[:company_area])
        format.html { redirect_to companies_url, notice: 'Company area was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @company_area = CompanyArea.find(params[:id])
    @company_area.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
    end
  end
end
