class Admin::CatalogsController < Admin::Backend
  
  def index
    @catalogs = Catalog.all
  end

  def new
    @catalog = Catalog.new
  end

  def edit
    @catalog = Catalog.find(params[:id])
  end
  
  def create
    @catalog = Catalog.new(params[:catalog])
    if @catalog.save
      redirect_to [:admin, :catalogs]
    else
      render :action => "new"
    end
  end

  def update
    @catalog = Catalog.find(params[:id])
    @catalog.update_attributes(params[:catalog])
    redirect_to [:admin, :catalogs]
  end

  def destroy
    @catalog = Catalog.find(params[:id])
    @catalog.destroy
    redirect_to [:admin, :catalogs]
  end
  
end
