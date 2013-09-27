class CreateTopicContents < ActiveRecord::Migration
  def change
    create_table :topic_contents do |t|
      t.integer :topic_id
      t.text :content

      t.timestamps
    end
  end
end
