FactoryBot.define do
  factory :item do
    name  {"aaa"}
    text  {"aaa"}
    days_to_ship_id {3}
    price {3000}
    user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
