class Topic < ActiveRecord::Base
  
  attr_accessible :catalog_id, :title, :summary, :content, :is_trash
  
  belongs_to :catalog
  
  def show_url
    "/news/#{self.id}"
  end
  
  def date
    self.created_at.strftime("%Y-%m-%d")
  end
  
end
