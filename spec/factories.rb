FactoryGirl.define do
  factory :line_item do
    order nil
    item nil
    quantity 1
  end
  factory :order do
    status "MyString"
    user nil
  end

  factory :user do
    username "janedoe"
    password "password"
    first_name "Jane"
    last_name "Doe"
    address "1510 Blake St., Denver, CO, 80202"
  end
  factory :category do
    title

    factory :category_with_items do
      items { create_list(:item, 3) }
    end
  end

  sequence :title, %w(1 2 3).cycle do |name|
    "#{name}"
  end

  sequence :item_name, %w(1 2 3 4 5 6).cycle do |number|
    "Lucky Item #{number}"
  end

  sequence :description, %w(1 2 3).cycle do |number|
    "#{number} description"
  end

  factory :item do
    title { generate(:item_name) }
    description
    price 1
    image File.new(Rails.root.join("spec",
                                   "support",
                                   "lucky_test.png"))
  end
end
