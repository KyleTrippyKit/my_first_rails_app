require "test_helper"

class TestItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_item = test_items(:one)
  end

  test "should get index" do
    get test_items_url
    assert_response :success
  end

  test "should get new" do
    get new_test_item_url
    assert_response :success
  end

  test "should create test_item" do
    assert_difference("TestItem.count") do
      post test_items_url, params: { test_item: { name: @test_item.name } }
    end

    assert_redirected_to test_item_url(TestItem.last)
  end

  test "should show test_item" do
    get test_item_url(@test_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_item_url(@test_item)
    assert_response :success
  end

  test "should update test_item" do
    patch test_item_url(@test_item), params: { test_item: { name: @test_item.name } }
    assert_redirected_to test_item_url(@test_item)
  end

  test "should destroy test_item" do
    assert_difference("TestItem.count", -1) do
      delete test_item_url(@test_item)
    end

    assert_redirected_to test_items_url
  end
end
