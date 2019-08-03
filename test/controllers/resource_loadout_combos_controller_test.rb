require 'test_helper'

class ResourceLoadoutCombosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resource_loadout_combo = resource_loadout_combos(:one)
  end

  test "should get index" do
    get resource_loadout_combos_url
    assert_response :success
  end

  test "should get new" do
    get new_resource_loadout_combo_url
    assert_response :success
  end

  test "should create resource_loadout_combo" do
    assert_difference('ResourceLoadoutCombo.count') do
      post resource_loadout_combos_url, params: { resource_loadout_combo: { offense_type_id: @resource_loadout_combo.offense_type_id, resource_id: @resource_loadout_combo.resource_id } }
    end

    assert_redirected_to resource_loadout_combo_url(ResourceLoadoutCombo.last)
  end

  test "should show resource_loadout_combo" do
    get resource_loadout_combo_url(@resource_loadout_combo)
    assert_response :success
  end

  test "should get edit" do
    get edit_resource_loadout_combo_url(@resource_loadout_combo)
    assert_response :success
  end

  test "should update resource_loadout_combo" do
    patch resource_loadout_combo_url(@resource_loadout_combo), params: { resource_loadout_combo: { offense_type_id: @resource_loadout_combo.offense_type_id, resource_id: @resource_loadout_combo.resource_id } }
    assert_redirected_to resource_loadout_combo_url(@resource_loadout_combo)
  end

  test "should destroy resource_loadout_combo" do
    assert_difference('ResourceLoadoutCombo.count', -1) do
      delete resource_loadout_combo_url(@resource_loadout_combo)
    end

    assert_redirected_to resource_loadout_combos_url
  end
end
