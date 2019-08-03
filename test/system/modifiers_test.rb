require "application_system_test_case"

class ModifiersTest < ApplicationSystemTestCase
  setup do
    @modifier = modifiers(:one)
  end

  test "visiting the index" do
    visit modifiers_url
    assert_selector "h1", text: "Modifiers"
  end

  test "creating a Modifier" do
    visit modifiers_url
    click_on "New Modifier"

    fill_in "Name", with: @modifier.name
    check "Replacewithshape" if @modifier.replacewithshape
    click_on "Create Modifier"

    assert_text "Modifier was successfully created"
    click_on "Back"
  end

  test "updating a Modifier" do
    visit modifiers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @modifier.name
    check "Replacewithshape" if @modifier.replacewithshape
    click_on "Update Modifier"

    assert_text "Modifier was successfully updated"
    click_on "Back"
  end

  test "destroying a Modifier" do
    visit modifiers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Modifier was successfully destroyed"
  end
end
