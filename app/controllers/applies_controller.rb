# encoding: utf-8
class AppliesController < ApplicationController
  before_filter :set_admin_nav_flag
  before_filter :need_admin_login

  # GET /Applies
  # GET /Applies.json
  def index
    @applies = Apply.paginate(:page => params[:page], :per_page => 20, :order => "id desc")

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @apply = Apply.find(params[:id])
  end

  # GET /Applies/new
  # GET /Applies/new.json
  def new
    @apply = Apply.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /Applies/1/edit
  def edit
    @apply = Apply.find(params[:id])
  end

  # POST /Applies
  # POST /Applies.json
  def create
    @apply = Apply.new(params[:apply])

    respond_to do |format|
      if @apply.save
        if params[:from].present?
          backto = url_for(:controller => params[:from])
        else
          backto = applies_url
        end
        format.html { redirect_to backto, notice: 'Apply was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /Applies/1
  # PUT /Applies/1.json
  def update
    @apply = Apply.find(params[:id])

    respond_to do |format|
      if @apply.update_attributes(params[:apply])
        archetype = Archetype.find(@apply.archetype_id)
        if @apply.passed
          Message.create(
            :user_id => @apply.user_id,
            :sysmsg  => true,
            :title   => "您的资源申请已经通过了",
            :content => "您申请的 <a target='_blank' href='/archetypes/#{archetype.id}'>#{archetype.name}</a> 已经通过审核。"
          )
        else
          Message.create(
            :user_id => @apply.user_id,
            :sysmsg  => true,
            :title   => "您的资源申请被拒绝了",
            :content => "您申请的 <a target='_blank' href='/archetypes/#{archetype.id}'>#{archetype.name}</a> 已经被拒绝了。"
          )
        end

        format.html { redirect_to applies_url, notice: 'Apply was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /Applies/1
  # DELETE /Applies/1.json
  def destroy
    @apply = Apply.find(params[:id])
    @apply.destroy

    respond_to do |format|
      format.html { redirect_to applies_url }
    end
  end

  private

  def set_admin_nav_flag
    @admin_nav_flag = params["from"]
  end
end
