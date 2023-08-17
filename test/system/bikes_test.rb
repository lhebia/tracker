require "application_system_test_case"

class BikesTest < ApplicationSystemTestCase
  test "Creating a new bike" do
    # When we visit the bikes#index page
    # we expect to see a title with the text "bikes"
    visit bikes_path
    assert_selector "h1", text: "bikes"

    # When we click on the link with the text "New bike"
    # we expect to land on a page with the title "New bike"
    click_on "New bike"
    assert_selector "h1", text: "New bike"

    # When we fill in the name input with "Capybara bike"
    # and we click on "Create bike"
    fill_in "Name", with: "Capybara bike"
    click_on "Create bike"

    # We expect to be back on the page with the title "bikes"
    # and to see our "Capybara bike" added to the list
    assert_selector "h1", text: "bikes"
    assert_text "Capybara bike"
  end
end
