require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    login_as users(:user1)

    @user = User.all.first
  end

  test "Showing a user" do
    visit users_path

    assert_selector "h1", text: @user.full_name
  end

  test "Updating a user" do
    visit users_path

    assert_selector "h1", text: @user.full_name

    click_on "Edit"
    fill_in "First name", with: "Updated"

    assert_selector "h1", text: "Edit user"
    click_on "Submit"

    assert_selector "h1", text: "Updated User"
  end
end
