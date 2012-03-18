#encoding: utf-8
class ArticlesController < ApplicationController
  before_filter :set_admin_nav_flag
  before_filter :need_admin_login
  
  def index
    # if params[:is_article]
    #   @admin_nav_flag = "articles"
    #   @articles = Article.is_article.paginate(:page => params[:page], :per_page => 20, :order => "id desc")
    # end
    # if params[:is_company]
    #   @admin_nav_flag = "companies"
    #   @articles = Article.is_company.paginate(:page => params[:page], :per_page => 20, :order => "id desc")
    # end
    # if params[:is_activity]
    #   @admin_nav_flag = "activities"
    #   @articles = Article.is_activity.paginate(:page => params[:page], :per_page => 20, :order => "id desc")
    # end
    # if params[:is_item]
    #   @admin_nav_flag = "items"
    #   @articles = Article.is_item.paginate(:page => params[:page], :per_page => 20, :order => "id desc")
    # end
    # if params[:is_brand]
    #   @admin_nav_flag = "brands"
    #   @articles = Article.is_brand.paginate(:page => params[:page], :per_page => 20, :order => "id desc")
    # end
    @admin_nav_flag = "articles"
    @articles = Article.paginate(:page => params[:page], :per_page => 20, :order => "id desc")
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @article.source_type = 1
    respond_to do |format|
      format.html
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        files = params[:photos].present? ? params[:photos][:file] : []
        files.each do |file|
          Photo.create(:file => file, :klass_type => "Article", :klass_id => @article.id) if file.present?
        end
        flash[:notice] = '添加成功'
        format.html { redirect_to @article }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        files = params[:photos].present? ? params[:photos][:file] : []
        files.each do |file|
          Photo.create(:file => file, :klass_type => "Article", :klass_id => @article.id) if file.present?
        end
        flash[:notice] = '编辑成功'
        format.html { redirect_to @article }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      flash[:notice] = '删除成功'
      format.html { redirect_to(articles_url) }
    end
  end
  
  def del_pic
    article = Article.find(params[:id])
    photo = article.photos.find(params[:pid])
    photo.destroy
    redirect_to :back
  end
  
  private
  
  def set_admin_nav_flag
    @admin_nav_flag = "articles"
  end
end