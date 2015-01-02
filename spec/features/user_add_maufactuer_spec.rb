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

      visit new_manufacturer_path
      
      fill_in "Name", with: "Mazda"
      fill_in "Country", with: "Japan"

      click_on "Create Manufacturer"

      expect(page). to have_content("success")
      expect(page). to have_content("Mazda")
      expect(page). to have_content("Japan")

    end

    scenario 'user inputs invalid fields' do
      visit new_manufacturer_path

      fill_in "Name", with: "Toyota"

      click_on "Create Manufacturer"

      expect(page). to have_content("can't be blank")

    end
end
