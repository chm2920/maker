#encoding: utf-8
class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :name
    end
    
    ["智能电子产品", "智慧家居用品", "数码视觉设计", "创新服饰设计", "综合", "其他"].each do |c|
      catalog = Catalog.create(:name => c)
    end
  end
end
