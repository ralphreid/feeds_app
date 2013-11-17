class CreateTags < ActiveRecord::Migration
  def up
    create_table :tags do |t|
      t.belongs_to :article
      t.belongs_to :user
      t.boolean :archive
      t.boolean :bookmark
      t.timestamps
    end
  end

  def down
    drop_table :tags
  end
end
