class Topic < ActiveRecord::Base
  
  attr_accessible :catalog_id, :title, :summary, :source, :is_trash
  
  belongs_to :catalog
  
  has_one :topic_content
  
  has_and_belongs_to_many :tags
  
  def show_url
    "/news/#{self.id}"
  end
  
  def date
    self.created_at.strftime("%Y-%m-%d")
  end
  
end
