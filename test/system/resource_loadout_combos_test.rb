require "application_system_test_case"

class ResourceLoadoutCombosTest < ApplicationSystemTestCase
  setup do
    @resource_loadout_combo = resource_loadout_combos(:one)
  end

  test "visiting the index" do
    visit resource_loadout_combos_url
    assert_selector "h1", text: "Resource Loadout Combos"
  end

  test "creating a Resource loadout combo" do
    visit resource_loadout_combos_url
    click_on "New Resource Loadout Combo"

    fill_in "Offense type", with: @resource_loadout_combo.offense_type_id
    fill_in "Resource", with: @resource_loadout_combo.resource_id
    click_on "Create Resource loadout combo"

    assert_text "Resource loadout combo was successfully created"
    click_on "Back"
  end

  test "updating a Resource loadout combo" do
    visit resource_loadout_combos_url
    click_on "Edit", match: :first

    fill_in "Offense type", with: @resource_loadout_combo.offense_type_id
    fill_in "Resource", with: @resource_loadout_combo.resource_id
    click_on "Update Resource loadout combo"

    assert_text "Resource loadout combo was successfully updated"
    click_on "Back"
  end

  test "destroying a Resource loadout combo" do
    visit resource_loadout_combos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Resource loadout combo was successfully destroyed"
  end
end
