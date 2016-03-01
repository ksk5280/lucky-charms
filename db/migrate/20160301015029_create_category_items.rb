class CreateCategoryItems < ActiveRecord::Migration
  def change
    create_table :category_items do |t|
      t.references :category, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
    end
  end
end
