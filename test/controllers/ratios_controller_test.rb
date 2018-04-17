require 'test_helper'

class RatiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ratio = ratios(:one)
  end

  test "should get index" do
    get ratios_url
    assert_response :success
  end

  test "should get new" do
    get new_ratio_url
    assert_response :success
  end

  test "should create ratio" do
    assert_difference('Ratio.count') do
      post ratios_url, params: { ratio: { currency_id: @ratio.currency_id, value: @ratio.value } }
    end

    assert_redirected_to ratio_url(Ratio.last)
  end

  test "should show ratio" do
    get ratio_url(@ratio)
    assert_response :success
  end

  test "should get edit" do
    get edit_ratio_url(@ratio)
    assert_response :success
  end

  test "should update ratio" do
    patch ratio_url(@ratio), params: { ratio: { currency_id: @ratio.currency_id, value: @ratio.value } }
    assert_redirected_to ratio_url(@ratio)
  end

  test "should destroy ratio" do
    assert_difference('Ratio.count', -1) do
      delete ratio_url(@ratio)
    end

    assert_redirected_to ratios_url
  end
end
