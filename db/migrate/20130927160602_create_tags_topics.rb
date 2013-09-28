class CreateTagsTopics < ActiveRecord::Migration
  def up
    create_table :tags_topics, :id => false do |t|
      t.integer :tag_id
      t.integer :topic_id
    end
  end

  def down
  end
end
