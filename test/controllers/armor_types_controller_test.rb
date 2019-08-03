require 'test_helper'

class ArmorTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @armor_type = armor_types(:one)
  end

  test "should get index" do
    get armor_types_url
    assert_response :success
  end

  test "should get new" do
    get new_armor_type_url
    assert_response :success
  end

  test "should create armor_type" do
    assert_difference('ArmorType.count') do
      post armor_types_url, params: { armor_type: { name: @armor_type.name } }
    end

    assert_redirected_to armor_type_url(ArmorType.last)
  end

  test "should show armor_type" do
    get armor_type_url(@armor_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_armor_type_url(@armor_type)
    assert_response :success
  end

  test "should update armor_type" do
    patch armor_type_url(@armor_type), params: { armor_type: { name: @armor_type.name } }
    assert_redirected_to armor_type_url(@armor_type)
  end

  test "should destroy armor_type" do
    assert_difference('ArmorType.count', -1) do
      delete armor_type_url(@armor_type)
    end

    assert_redirected_to armor_types_url
  end
end
