require "application_system_test_case"

class BikesTest < ApplicationSystemTestCase
  setup do
    login_as users(:user1)

    @bike = Bike.ordered.first
  end

  test "Showing a bike" do
    visit bikes_path
    click_link @bike.name

    assert_selector "h1", text: @bike.name
  end

  test "Creating a new bike" do
    visit bikes_path
    assert_selector "h1", text: "Bikes"

    click_on "New bike"
    fill_in "Name", with: "Capybara bike"
    fill_in "Year", with: "2022"

    assert_selector "h1", text: "New bike"
    click_on "Submit"

    assert_selector "h1", text: "Bikes"
    assert_text "Capybara bike"
  end

  test "Updating a bike" do
    visit bikes_path
    assert_selector "h1", text: "Bikes"

    click_on "Edit", match: :first
    fill_in "Name", with: "Updated bike"

    assert_selector "h1", text: "Edit bike"
    click_on "Submit"

    assert_selector "h1", text: "Bikes"
    assert_text "Updated bike"
  end

  test "Destroying a bike" do
    visit bikes_path
    assert_text @bike.name

    click_on "Edit", match: :first

    accept_confirm do
      click_on "Delete", match: :first
    end

    assert_no_text @bike.name
  end
end
