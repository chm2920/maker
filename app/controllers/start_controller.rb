class StartController < ApplicationController
  
  def index
    @topics = Topic.paginate :page => params[:page], :per_page => 10, :conditions => "is_trash = 0", :order => "id desc"
    @friendlinks = Friendlink.find(:all, :order => "rank asc")
  end
  
  def show
    @topic = Topic.find(params[:id])
  end
  
end
