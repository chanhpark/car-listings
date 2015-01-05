require "factory_girl"

FactoryGirl.define do
  factory :manufacturer do
    name "Dodge"
    country "United States of America"
  end
end


FactoryGirl.define do
  factory :car do
    year "2002"
    color "Blue"
    mileage 17000
  end
end
