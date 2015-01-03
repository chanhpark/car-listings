require "factory_girl"

FactoryGirl.define do
  factory :manufacturer do
    name "Kia"
    country "Korea (South)"
  end
end


FactoryGirl.define do
  factory :car do
    year "2002"
    color "Blue"
    mileage 17000
  end
end
