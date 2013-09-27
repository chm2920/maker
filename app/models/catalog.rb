class Catalog < ActiveRecord::Base
  
  attr_accessible :name
  
  has_many :topics, :dependent => :destroy, :order => "id desc"
  
  def show_url
    "/catalog/#{self.name}"
  end
  
end
