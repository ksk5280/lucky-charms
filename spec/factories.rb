FactoryGirl.define do
  factory :order do
    status "MyString"
    user nil
  end

  factory :user do
    username "janedoe"
    password "password"
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
    image "/images/horseshoe.png"
  end
end
