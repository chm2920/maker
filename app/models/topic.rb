class Topic < ActiveRecord::Base
  
  attr_accessible :catalog_id, :title, :special_url, :summary, :source, :is_trash
  
  belongs_to :catalog
  
  has_one :topic_content
  
  has_and_belongs_to_many :tags
  
  def show_url
    "/#{self.special_url}.html"
  end 
  
  def show_tags
    self.tags.map{|t|t.name}.join(',')
  end
  
  def i_show_tags
    self.tags.map{|t|"<a href=\"" + t.show_url + "\">" + t.name + "</a>"}.join('').html_safe
  end
  
  def date
    self.created_at.strftime("%Y-%m-%d")
  end
  
end
