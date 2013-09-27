class StartController < ApplicationController
  
  before_filter :find_catalogs
  
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
    @topics = Topic.paginate :page => params[:page], :per_page => 10, :conditions => ["catalog_id = ?", @catalog.id], :order => "id desc"
  end
  
  def show
    @topic = Topic.find(params[:id])
  end
  
private
  
  def find_catalogs
    @catalogs = Catalog.all
  end
  
end
