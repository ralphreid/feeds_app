class AddImageOmniauthToUser < ActiveRecord::Migration
  def change
    add_column :users, :image_omniauth, :text
  end
end
