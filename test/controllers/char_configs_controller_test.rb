require 'test_helper'

class CharConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @char_config = char_configs(:one)
  end

  test "should get index" do
    get char_configs_url
    assert_response :success
  end

  test "should get new" do
    get new_char_config_url
    assert_response :success
  end

  test "should create char_config" do
    assert_difference('CharConfig.count') do
      post char_configs_url, params: { char_config: { elementdoublepct: @char_config.elementdoublepct, statlinemax: @char_config.statlinemax } }
    end

    assert_redirected_to char_config_url(CharConfig.last)
  end

  test "should show char_config" do
    get char_config_url(@char_config)
    assert_response :success
  end

  test "should get edit" do
    get edit_char_config_url(@char_config)
    assert_response :success
  end

  test "should update char_config" do
    patch char_config_url(@char_config), params: { char_config: { elementdoublepct: @char_config.elementdoublepct, statlinemax: @char_config.statlinemax } }
    assert_redirected_to char_config_url(@char_config)
  end

  test "should destroy char_config" do
    assert_difference('CharConfig.count', -1) do
      delete char_config_url(@char_config)
    end

    assert_redirected_to char_configs_url
  end
end
