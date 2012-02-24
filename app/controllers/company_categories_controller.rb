class CompanyCategoriesController < ApplicationController

  def index
    @company_categories = CompanyCategory.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @company_category = CompanyCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @company_category = CompanyCategory.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @company_category = CompanyCategory.find(params[:id])
  end

  def create
    @company_category = CompanyCategory.new(params[:company_category])

    respond_to do |format|
      if @company_category.save
        format.html { redirect_to companies_path, notice: 'Company category was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @company_category = CompanyCategory.find(params[:id])

    respond_to do |format|
      if @company_category.update_attributes(params[:company_category])
        format.html { redirect_to companies_url, notice: 'Company category was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @company_category = CompanyCategory.find(params[:id])
    @company_category.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
    end
  end
end
