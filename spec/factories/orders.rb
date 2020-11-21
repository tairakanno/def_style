FactoryBot.define do
  factory :order do
    postal_code {"111-1111"}
    prefecture_id {3}
    municipality  {'東京都'}
    address { '1-1-1' }
    building_name { '東京ハイツ' }
    phone_number { "99999999999" }
    token { 'tok_0000000000' }
    # user_id {3}
    # item_id {3}
  end
end
