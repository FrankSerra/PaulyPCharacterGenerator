require "application_system_test_case"

class ArmorTypesTest < ApplicationSystemTestCase
  setup do
    @armor_type = armor_types(:one)
  end

  test "visiting the index" do
    visit armor_types_url
    assert_selector "h1", text: "Armor Types"
  end

  test "creating a Armor type" do
    visit armor_types_url
    click_on "New Armor Type"

    fill_in "Name", with: @armor_type.name
    click_on "Create Armor type"

    assert_text "Armor type was successfully created"
    click_on "Back"
  end

  test "updating a Armor type" do
    visit armor_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @armor_type.name
    click_on "Update Armor type"

    assert_text "Armor type was successfully updated"
    click_on "Back"
  end

  test "destroying a Armor type" do
    visit armor_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Armor type was successfully destroyed"
  end
end
