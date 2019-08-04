require 'test_helper'

class ElementUpgradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @element_upgrade = element_upgrades(:one)
  end

  test "should get index" do
    get element_upgrades_url
    assert_response :success
  end

  test "should get new" do
    get new_element_upgrade_url
    assert_response :success
  end

  test "should create element_upgrade" do
    assert_difference('ElementUpgrade.count') do
      post element_upgrades_url, params: { element_upgrade: { combohash: @element_upgrade.combohash, name: @element_upgrade.name } }
    end

    assert_redirected_to element_upgrade_url(ElementUpgrade.last)
  end

  test "should show element_upgrade" do
    get element_upgrade_url(@element_upgrade)
    assert_response :success
  end

  test "should get edit" do
    get edit_element_upgrade_url(@element_upgrade)
    assert_response :success
  end

  test "should update element_upgrade" do
    patch element_upgrade_url(@element_upgrade), params: { element_upgrade: { combohash: @element_upgrade.combohash, name: @element_upgrade.name } }
    assert_redirected_to element_upgrade_url(@element_upgrade)
  end

  test "should destroy element_upgrade" do
    assert_difference('ElementUpgrade.count', -1) do
      delete element_upgrade_url(@element_upgrade)
    end

    assert_redirected_to element_upgrades_url
  end
end
