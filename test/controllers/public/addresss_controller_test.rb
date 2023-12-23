require "test_helper"

class Public::AddresssControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_addresss_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_addresss_edit_url
    assert_response :success
  end
end
