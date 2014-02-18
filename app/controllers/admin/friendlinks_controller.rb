class Admin::FriendlinksController < Admin::Backend
  
  def index
    @friendlinks = Friendlink.find(:all, :order => "rank asc")
  end
  
  def batch_update
    params.permit!
    if params[:friendlink]
      params[:friendlink].each do |key, val|
        friendlink = Friendlink.find(key)
        if friendlink
          friendlink.rank = val[:rank]
          friendlink.title = val[:title]
          friendlink.link = val[:link]
          friendlink.save
        end
      end
    end
    redirect_to [:admin, :friendlinks]
  end

  def new
    @friendlink = Friendlink.new
  end
  
  def create
    params.permit!
    @friendlink = Friendlink.new(params[:friendlink])
    f = Friendlink.find_by_sql("select max(rank) as rank from friendlinks")
    @friendlink.rank = !f[0].rank.nil? ? (f[0].rank + 1) : 0
    if @friendlink.save
      redirect_to [:admin, :friendlinks]
    else
      render :action => "new"
    end
  end

  def destroy
    @friendlink = Friendlink.find(params[:id])
    @friendlink.destroy
    redirect_to [:admin, :friendlinks]
  end
  
end
