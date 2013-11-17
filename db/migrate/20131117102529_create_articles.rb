class CreateArticles < ActiveRecord::Migration
  def up
    create_table :articles do |t|
      t.belongs_to :feed
      t.string :title
      t.text :content
      t.text :link
      t.text :description
      t.string :author
      t.text :comment_link
      t.timestamps
    end
  end

  def down
    drop_table :articles
  end
end
