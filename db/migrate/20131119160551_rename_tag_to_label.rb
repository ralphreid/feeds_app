class RenameTagToLabel < ActiveRecord::Migration
  def up
    rename_table :tags, :labels
  end

  def down
    rename_table :labels, :tags
  end
end
