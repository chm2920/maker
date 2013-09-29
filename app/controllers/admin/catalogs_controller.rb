class Admin::CatalogsController < Admin::Backend
  
  def index
    @catalogs = Catalog.find(:all, :order => "rank asc")
  end
  
  def batch_update
    if params[:catalog]
      params[:catalog].each do |key, val|
        catalog = Catalog.find(key)
        if catalog
          catalog.name = val[:name]
          catalog.rank = val[:rank]
          catalog.save
        end
      end
    end
    redirect_to [:admin, :catalogs]
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
