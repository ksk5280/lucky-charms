class AddDefaultImageToCategories < ActiveRecord::Migration
  def change
    change_column_default :categories, :image, "default.png"
  end
end
