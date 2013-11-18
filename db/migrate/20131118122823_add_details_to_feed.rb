class AddDetailsToFeed < ActiveRecord::Migration
  def change
    add_column :feeds, :last_modified, :datetime
    add_column :feeds, :guid, :string
  end
end

