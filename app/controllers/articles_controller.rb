#encoding: utf-8
class ArticlesController < ApplicationController
  before_filter :set_admin_nav_flag
  before_filter :need_admin_login
  
  def index
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