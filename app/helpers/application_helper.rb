module ApplicationHelper
  def add_to_cart_button(item)
    if item.retired
      "Item has been retired"
    else
      button_to "Add to Cart",
      cart_items_path(item_id: item.id),
      class: "btn item-btn mousiness btn-font-size"
    end
  end
end
