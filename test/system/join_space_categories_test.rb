require "application_system_test_case"

class JoinSpaceCategoriesTest < ApplicationSystemTestCase
  setup do
    @join_space_category = join_space_categories(:one)
  end

  test "visiting the index" do
    visit join_space_categories_url
    assert_selector "h1", text: "Join Space Categories"
  end

  test "creating a Join space category" do
    visit join_space_categories_url
    click_on "New Join Space Category"

    click_on "Create Join space category"

    assert_text "Join space category was successfully created"
    click_on "Back"
  end

  test "updating a Join space category" do
    visit join_space_categories_url
    click_on "Edit", match: :first

    click_on "Update Join space category"

    assert_text "Join space category was successfully updated"
    click_on "Back"
  end

  test "destroying a Join space category" do
    visit join_space_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Join space category was successfully destroyed"
  end
end
