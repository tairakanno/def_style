FactoryBot.define do
  factory :opus do
    title   {"aaa"}
    description  {"aaa"}
    user
    after(:build) do |opus|
      opus.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
