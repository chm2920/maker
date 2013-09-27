class CreateTopicsTags < ActiveRecord::Migration
  def up
    create_table :topics_tags, :id => false do |t|
      t.string :topic_id
      t.string :tag_id
    end
  end

  def down
  end
end
