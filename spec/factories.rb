FactoryGirl.define do
  factory :category do
    title

    factory :category_with_items do
      items { create_list(:item, 3) }
    end
  end

  sequence :title, %w(1 2 3).cycle do |name|
    "#{name}"
  end

  sequence :item_name do |number|
    "Lucky Item #{number}"
  end

  sequence :description, %w(1 2 3).cycle do |number|
    "#{number} description"
  end

  factory :item do
    title { generate(:item_name) }
    description
    price 1
    image "http://bit.ly/1RlgZV5"
  end
end
