class StartController < ApplicationController
  
  before_filter :find_tags
  
  def index
    @topics = Topic.paginate :page => params[:page], :per_page => 10, :conditions => "is_trash = 0", :order => "id desc"
    @friendlinks = Friendlink.find(:all, :order => "rank asc")
  end
  
  def catalog
    @catalog = Catalog.find_by_name(params[:id])
    if @catalog.blank?
      redirect_to "/"
      return
    end
    @topics = Topic.paginate :page => params[:page], :per_page => 10, :conditions => ["catalog_id = ? and is_trash = 0", @catalog.id], :order => "id desc"
  end
  
  def tag
    @tag = Tag.find_by_name(params[:id])
    if @tag.blank?
      redirect_to "/"
      return
    end
    @topics = @tag.topics.paginate :page => params[:page], :per_page => 10, :conditions => ["is_trash = 0"], :order => "id desc"
  end
  
  def show
    @topic = Topic.find_by_special_url(params[:id])
    if @topic.blank?
      redirect_to "/"
      return
    end
  end
  
private
  
  def find_tags
    # @catalogs = Catalog.find(:all, :order => "rank asc")
    @tags = Tag.all
  end
  
end
