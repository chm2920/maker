class Catalog < ActiveRecord::Base
  
  has_many :topics, :dependent => :destroy, :order => "id desc"
  
  def show_url
    "/catalog/#{self.name}"
  end
  
end
