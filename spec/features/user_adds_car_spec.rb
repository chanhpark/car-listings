require 'rails_helper'

feature 'user adds a car',%q(
As a car salesperson
I want to record a newly acquired car
So that I can list it in my lot

Acceptance Criteria:
-[ ] I must specify the manufacturer, color, year, and mileage of the car.
-[ ] Only years from 1920 and above can be specified.
-[ ] I can optionally specify a description of the car.
-[ ] If I enter all of the required information in the required formats, the car is recorded and I am presented with a notification of success
-[ ] If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
-[ ] Upon successfully creating a car, I am redirected back to the index of cars.
  ) do

    scenario 'create a valid car' do
      @manufacturer = FactoryGirl.create(:manufacturer)
      car = FactoryGirl.build(:car)

      visit new_car_path
      select(@manufacturer.name, from: :manufacturer)
      fill_in "Color", with: car.color
      select(car.year, from: 'Year')
      fill_in "Mileage", with: car.mileage

      click_on "Create Car"

      expect(page). to have_content("success")
      expect(page). to have_content("Blue")
      expect(page). to have_content("2002")
      expect(page). to have_content("17000")

    end

    scenario 'user inputs invalid fields' do

      visit new_car_path

      click_on "Create Car"

      expect(page). to have_content("can't be blank")

    end
  end
