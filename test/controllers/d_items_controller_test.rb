require 'test_helper'

class DItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @d_item = d_items(:one)
  end

  test "should get index" do
    get d_items_url
    assert_response :success
  end

  test "should get new" do
    get new_d_item_url
    assert_response :success
  end

  test "should create d_item" do
    assert_difference('DItem.count') do
      post d_items_url, params: { d_item: { item_id: @d_item.item_id, propuest_id: @d_item.propuest_id } }
    end

    assert_redirected_to d_item_url(DItem.last)
  end

  test "should show d_item" do
    get d_item_url(@d_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_d_item_url(@d_item)
    assert_response :success
  end

  test "should update d_item" do
    patch d_item_url(@d_item), params: { d_item: { item_id: @d_item.item_id, propuest_id: @d_item.propuest_id } }
    assert_redirected_to d_item_url(@d_item)
  end

  test "should destroy d_item" do
    assert_difference('DItem.count', -1) do
      delete d_item_url(@d_item)
    end

    assert_redirected_to d_items_url
  end
end
