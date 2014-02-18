class Admin::TagsController < Admin::Backend
  
  def index
    @page = params[:page] || 1
    @tags = Tag.paginate :page => @page, :per_page => 15, :order => "id desc"
  end

  def new
    @page = params[:page] || 1
    @tag = Tag.new
  end

  def edit
    @page = params[:page] || 1
    @tag = Tag.find(params[:id])
  end
  
  def create
    params.permit!
    @tag = Tag.new(params[:tag])
    if @tag.save
      redirect_to [:admin, :tags], :page => params[:page]
    else
      render :action => "new"
    end
  end

  def update
    params.permit!
    @tag = Tag.find(params[:id])
    @tag.update_attributes(params[:tag])
    redirect_to [:admin, :tags], :page => params[:page]
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to [:admin, :tags], :page => params[:page]
  end
  
end
