require 'test_helper'

class WeaponOffenseTypeCombosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weapon_offense_type_combo = weapon_offense_type_combos(:one)
  end

  test "should get index" do
    get weapon_offense_type_combos_url
    assert_response :success
  end

  test "should get new" do
    get new_weapon_offense_type_combo_url
    assert_response :success
  end

  test "should create weapon_offense_type_combo" do
    assert_difference('WeaponOffenseTypeCombo.count') do
      post weapon_offense_type_combos_url, params: { weapon_offense_type_combo: { alwayspick: @weapon_offense_type_combo.alwayspick, offensetype_id: @weapon_offense_type_combo.offensetype_id, weapon_id: @weapon_offense_type_combo.weapon_id } }
    end

    assert_redirected_to weapon_offense_type_combo_url(WeaponOffenseTypeCombo.last)
  end

  test "should show weapon_offense_type_combo" do
    get weapon_offense_type_combo_url(@weapon_offense_type_combo)
    assert_response :success
  end

  test "should get edit" do
    get edit_weapon_offense_type_combo_url(@weapon_offense_type_combo)
    assert_response :success
  end

  test "should update weapon_offense_type_combo" do
    patch weapon_offense_type_combo_url(@weapon_offense_type_combo), params: { weapon_offense_type_combo: { alwayspick: @weapon_offense_type_combo.alwayspick, offensetype_id: @weapon_offense_type_combo.offensetype_id, weapon_id: @weapon_offense_type_combo.weapon_id } }
    assert_redirected_to weapon_offense_type_combo_url(@weapon_offense_type_combo)
  end

  test "should destroy weapon_offense_type_combo" do
    assert_difference('WeaponOffenseTypeCombo.count', -1) do
      delete weapon_offense_type_combo_url(@weapon_offense_type_combo)
    end

    assert_redirected_to weapon_offense_type_combos_url
  end
end
