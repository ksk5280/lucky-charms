class AddDefaultImagetoItems < ActiveRecord::Migration
  def change
    change_column_default :items, :image, "default.png"
  end
end
