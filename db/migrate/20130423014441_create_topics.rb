class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :catalog_id
      t.string :title
      t.string :summary
      t.text :content
      t.integer :is_trash, :default => 0

      t.timestamps
    end
  end
end
