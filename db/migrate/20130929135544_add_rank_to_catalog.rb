class AddRankToCatalog < ActiveRecord::Migration
  def change
    add_column :catalogs, :rank, :integer
  end
end
