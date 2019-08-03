require "application_system_test_case"

class CharConfigsTest < ApplicationSystemTestCase
  setup do
    @char_config = char_configs(:one)
  end

  test "visiting the index" do
    visit char_configs_url
    assert_selector "h1", text: "Char Configs"
  end

  test "creating a Char config" do
    visit char_configs_url
    click_on "New Char Config"

    fill_in "Elementdoublepct", with: @char_config.elementdoublepct
    fill_in "Statlinemax", with: @char_config.statlinemax
    click_on "Create Char config"

    assert_text "Char config was successfully created"
    click_on "Back"
  end

  test "updating a Char config" do
    visit char_configs_url
    click_on "Edit", match: :first

    fill_in "Elementdoublepct", with: @char_config.elementdoublepct
    fill_in "Statlinemax", with: @char_config.statlinemax
    click_on "Update Char config"

    assert_text "Char config was successfully updated"
    click_on "Back"
  end

  test "destroying a Char config" do
    visit char_configs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Char config was successfully destroyed"
  end
end
