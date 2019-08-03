require "application_system_test_case"

class OffenseTypesTest < ApplicationSystemTestCase
  setup do
    @offense_type = offense_types(:one)
  end

  test "visiting the index" do
    visit offense_types_url
    assert_selector "h1", text: "Offense Types"
  end

  test "creating a Offense type" do
    visit offense_types_url
    click_on "New Offense Type"

    fill_in "Name", with: @offense_type.name
    fill_in "Numberofweapons", with: @offense_type.numberofweapons
    click_on "Create Offense type"

    assert_text "Offense type was successfully created"
    click_on "Back"
  end

  test "updating a Offense type" do
    visit offense_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @offense_type.name
    fill_in "Numberofweapons", with: @offense_type.numberofweapons
    click_on "Update Offense type"

    assert_text "Offense type was successfully updated"
    click_on "Back"
  end

  test "destroying a Offense type" do
    visit offense_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Offense type was successfully destroyed"
  end
end
