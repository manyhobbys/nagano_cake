require "test_helper"

class Public::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_orders_new_url
    assert_response :success
  end

  test "should get thanks" do
    get public_orders_thanks_url
    assert_response :success
  end
end
