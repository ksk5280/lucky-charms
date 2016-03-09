class RemoveImageLocationFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :image_location
  end
end
