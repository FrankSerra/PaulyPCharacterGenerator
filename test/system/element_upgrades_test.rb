require "application_system_test_case"

class ElementUpgradesTest < ApplicationSystemTestCase
  setup do
    @element_upgrade = element_upgrades(:one)
  end

  test "visiting the index" do
    visit element_upgrades_url
    assert_selector "h1", text: "Element Upgrades"
  end

  test "creating a Element upgrade" do
    visit element_upgrades_url
    click_on "New Element Upgrade"

    fill_in "Combohash", with: @element_upgrade.combohash
    fill_in "Name", with: @element_upgrade.name
    click_on "Create Element upgrade"

    assert_text "Element upgrade was successfully created"
    click_on "Back"
  end

  test "updating a Element upgrade" do
    visit element_upgrades_url
    click_on "Edit", match: :first

    fill_in "Combohash", with: @element_upgrade.combohash
    fill_in "Name", with: @element_upgrade.name
    click_on "Update Element upgrade"

    assert_text "Element upgrade was successfully updated"
    click_on "Back"
  end

  test "destroying a Element upgrade" do
    visit element_upgrades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Element upgrade was successfully destroyed"
  end
end
