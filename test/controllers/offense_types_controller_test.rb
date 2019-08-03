require 'test_helper'

class OffenseTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offense_type = offense_types(:one)
  end

  test "should get index" do
    get offense_types_url
    assert_response :success
  end

  test "should get new" do
    get new_offense_type_url
    assert_response :success
  end

  test "should create offense_type" do
    assert_difference('OffenseType.count') do
      post offense_types_url, params: { offense_type: { name: @offense_type.name, numberofweapons: @offense_type.numberofweapons } }
    end

    assert_redirected_to offense_type_url(OffenseType.last)
  end

  test "should show offense_type" do
    get offense_type_url(@offense_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_offense_type_url(@offense_type)
    assert_response :success
  end

  test "should update offense_type" do
    patch offense_type_url(@offense_type), params: { offense_type: { name: @offense_type.name, numberofweapons: @offense_type.numberofweapons } }
    assert_redirected_to offense_type_url(@offense_type)
  end

  test "should destroy offense_type" do
    assert_difference('OffenseType.count', -1) do
      delete offense_type_url(@offense_type)
    end

    assert_redirected_to offense_types_url
  end
end
