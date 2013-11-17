class CreateSubscriptions < ActiveRecord::Migration

  def change
    create_table :subscriptions do |t|
      t.belongs_to :feed
      t.belongs_to :user
      t.string :category
      t.timestamps
    end
    add_index :subscriptions, :feed_id
    add_index :subscriptions, :user_id
  end

end
