require 'test_helper'

class AmountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @amount = amounts(:one)
  end

  test "should get index" do
    get amounts_url
    assert_response :success
  end

  test "should get new" do
    get new_amount_url
    assert_response :success
  end

  test "should create amount" do
    assert_difference('Amount.count') do
      post amounts_url, params: { amount: { currency_id: @amount.currency_id, quantity: @amount.quantity, user_id: @amount.user_id } }
    end

    assert_redirected_to amount_url(Amount.last)
  end

  test "should show amount" do
    get amount_url(@amount)
    assert_response :success
  end

  test "should get edit" do
    get edit_amount_url(@amount)
    assert_response :success
  end

  test "should update amount" do
    patch amount_url(@amount), params: { amount: { currency_id: @amount.currency_id, quantity: @amount.quantity, user_id: @amount.user_id } }
    assert_redirected_to amount_url(@amount)
  end

  test "should destroy amount" do
    assert_difference('Amount.count', -1) do
      delete amount_url(@amount)
    end

    assert_redirected_to amounts_url
  end
end
