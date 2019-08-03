require "application_system_test_case"

class WeaponOffenseTypeCombosTest < ApplicationSystemTestCase
  setup do
    @weapon_offense_type_combo = weapon_offense_type_combos(:one)
  end

  test "visiting the index" do
    visit weapon_offense_type_combos_url
    assert_selector "h1", text: "Weapon Offense Type Combos"
  end

  test "creating a Weapon offense type combo" do
    visit weapon_offense_type_combos_url
    click_on "New Weapon Offense Type Combo"

    check "Alwayspick" if @weapon_offense_type_combo.alwayspick
    fill_in "Offensetype", with: @weapon_offense_type_combo.offensetype_id
    fill_in "Weapon", with: @weapon_offense_type_combo.weapon_id
    click_on "Create Weapon offense type combo"

    assert_text "Weapon offense type combo was successfully created"
    click_on "Back"
  end

  test "updating a Weapon offense type combo" do
    visit weapon_offense_type_combos_url
    click_on "Edit", match: :first

    check "Alwayspick" if @weapon_offense_type_combo.alwayspick
    fill_in "Offensetype", with: @weapon_offense_type_combo.offensetype_id
    fill_in "Weapon", with: @weapon_offense_type_combo.weapon_id
    click_on "Update Weapon offense type combo"

    assert_text "Weapon offense type combo was successfully updated"
    click_on "Back"
  end

  test "destroying a Weapon offense type combo" do
    visit weapon_offense_type_combos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Weapon offense type combo was successfully destroyed"
  end
end
