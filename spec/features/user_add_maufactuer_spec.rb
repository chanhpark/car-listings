require 'rails_helper'

feature 'user adds a car manufacturer',%q(
As a car salesperson
I want to record a car manufacturer
So that I can keep track of the types of cars found in the lot
Acceptance Criteria:
- [X] I must specify a manufacturer name and country.
- [X] If I do not specify the required information, I am presented with errors.
- [X] If I specify the required information, the manufacturer is recorded and I am redirected to the index of manufacturers
  ) do

    scenario 'create a valid car manufacturer' do
      @manufacturer = FactoryGirl.create(:manufacturer)
      visit new_manufacturer_path
      save_and_open_page
      fill_in "Name", with: @manufacturer.name
      select(@manufacturer.country)

      click_on "Create Manufacturer"

      expect(page). to have_content("Ford")
      expect(page). to have_content("United States of America")
    end

    scenario 'user inputs invalid fields' do
      visit new_manufacturer_path

      fill_in "Name", with: "Kia"

      click_on "Create Manufacturer"

      expect(page). to have_content("can't be blank")
    end
    scenario 'user enters an existing manufacturer name' do

      FactoryGirl.create(:manufacturer, name: "Ford")

      visit new_manufacturer_path

      fill_in "Name", with: "Ford"

      click_on "Create Manufacturer"

      expect(page). to have_content("can't be blank")

    end
end
