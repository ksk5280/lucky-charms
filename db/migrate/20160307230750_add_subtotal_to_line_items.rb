class AddSubtotalToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :subtotal, :integer
  end
end
