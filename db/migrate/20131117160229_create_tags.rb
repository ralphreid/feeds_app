class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.belongs_to :article
      t.belongs_to :user
      t.boolean :archive
      t.boolean :bookmark
      t.timestamps
    end
    add_index :tags, :article_id
    add_index :tags, :user_id
  end
end
