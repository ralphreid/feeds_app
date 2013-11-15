class CreateFeeds < ActiveRecord::Migration
  def up
    create_table :feeds do |t|
      t.string :title
      t.text :image_link
      t.text :link
      t.txt :rss
      t.string :provider
      t.string :category
      t.text :description
    end
  end

  def down
    drop_table :feeds
  end
end
