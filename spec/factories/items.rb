FactoryBot.define do
  factory :item do
    product_name              {"商品名です"}
    description               {"商品説明文です"}
    category_id               {2}
    status_id                 {2}
    burden_id                 {2}
    delivery_id               {2}
    days_delivery_id          {2}
    price                     {500}
    association :user 
  end
end
