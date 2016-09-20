FactoryGirl.define do
  factory :device do
    user
    category
    sequence(:bt_mac_address, &:to_s)
    sequence(:name) { |n| "device-#{n}" }
    sequence(:power) { |n| n }
  end
end
