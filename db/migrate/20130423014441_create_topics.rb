class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :catalog_id
      t.string :title
      t.string :source
      t.string :summary
      t.integer :hits, :default => 0
      t.integer :is_trash, :default => 0

      t.timestamps
    end
  end
end
