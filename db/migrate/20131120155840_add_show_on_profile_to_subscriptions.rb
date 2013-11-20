class AddShowOnProfileToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :show_on_profile, :boolean
  end
end
