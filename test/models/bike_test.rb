require "application_system_test_case"

class BikesTest < ApplicationSystemTestCase
  setup do
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

    assert_selector "h1", text: "Bikes"
    click_on "Create bike"

    assert_selector "h1", text: "Bikes"
    assert_text "Capybara bike"
  end

  test "Updating a bike" do
    visit bikes_path
    assert_selector "h1", text: "Bikes"

    click_on "Edit", match: :first
    fill_in "Name", with: "Updated bike"

    assert_selector "h1", text: "Bikes"
    click_on "Update bike"

    assert_selector "h1", text: "Bikes"
    assert_text "Updated bike"
  end

  test "Destroying a bike" do
    visit bikes_path
    assert_text @bike.name

    click_on "Delete", match: :first
    assert_no_text @bike.name
  end
end
