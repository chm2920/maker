class Admin::TopicsController < Admin::Backend
  
  def index
    if !params[:topic_ids].nil?
      params[:topic_ids].each do |topic_id|
        topic = Topic.find(topic_id)
        topic.is_trash = 1
        topic.save
      end
    end
    if !params[:page].nil?
      @page = params[:page].to_i
    else
      @page = 1
    end
    @topics = Topic.paginate :page => @page, :per_page => 20, :conditions => "is_trash = 0", :order => "id desc"
  end
  
  def trashes
    if !params[:topic_ids].nil?
      Topic.destroy_all(["id in (?)", params[:topic_ids]])
    end
    if !params[:page].nil?
      @page = params[:page].to_i
    else
      @page = 1
    end
    @topics = Topic.paginate :page => @page, :per_page => 20, :conditions => "is_trash = 1", :order => "id desc"
  end

  def new
    @catalogs = Catalog.all
    @page = 1
    @topic = Topic.new
  end

  def edit
    @catalogs = Catalog.all
    @page = params[:page]
    @topic = Topic.find(params[:id])
  end
  
  def create
    @topic = Topic.new(params[:topic])
    @topic.content = params[:content]
    if !params[:pub_date].nil?
      begin
        @topic.created_at = Date.parse(params[:pub_date]) + 1.day
      rescue
        @topic.created_at = Time.now
      else
      end
    end
    if @topic.save
      redirect_to [:admin, :topics]
    else
      render :action => "new"
    end
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.content = params[:content]
    if !params[:pub_date].nil?
      begin
        @topic.created_at = Date.parse(params[:pub_date]) + 1.day
      rescue
        @topic.created_at = Time.now
      else
      end
    end
    @topic.update_attributes(params[:topic])
    redirect_to :action => :index, :page => params[:page]
  end
  
  def del
    @topic = Topic.find(params[:id])
    @topic.is_trash = 1
    @topic.save
    redirect_to :action => :index, :page => params[:page]
  end
  
  def repost
    @topic = Topic.find(params[:id])
    @topic.is_trash = 0
    @topic.save
    redirect_to [:admin, :topics, :trashes], :page => params[:page]
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to [:admin, :topics, :trashes], :page => params[:page]
  end
  
  def clear
    Topic.destroy_all(:is_trash => 1)
    redirect_to [:admin, :topics, :trashes]
  end
  
private

  def p_format(content)
    content = content.gsub(/<p(.*?)>/, "<p>")
    content = content.gsub(/<span(.*?)>/, "<span>")
    content
  end
  
end
