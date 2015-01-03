class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :manufacturer, presence: true
  validates :color, presence: true
  validates :mileage, presence: true
  validates :year, presence: true, format: { with: /(19|20)\d{2}/i,
  message: "should be a four-digit year" }
end
