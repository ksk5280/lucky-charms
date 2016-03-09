class AddAttachmentImageToItems < ActiveRecord::Migration
  def change
    rename_column :items, :image, :image_location
    change_table :items do |t|
      t.attachment :image
    end
  end
end
