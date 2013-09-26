class Catalog < ActiveRecord::Base
  
  attr_accessible :name
  
  has_many :topics, :dependent => :destroy, :order => "id desc"
  
  def show_url
    "/news_list/#{self.id}"
  end
  
end
