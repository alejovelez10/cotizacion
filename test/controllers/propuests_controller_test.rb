require 'test_helper'

class PropuestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @propuest = propuests(:one)
  end

  test "should get index" do
    get propuests_url
    assert_response :success
  end

  test "should get new" do
    get new_propuest_url
    assert_response :success
  end

  test "should create propuest" do
    assert_difference('Propuest.count') do
      post propuests_url, params: { propuest: { cliente_id: @propuest.cliente_id, descripcion: @propuest.descripcion } }
    end

    assert_redirected_to propuest_url(Propuest.last)
  end

  test "should show propuest" do
    get propuest_url(@propuest)
    assert_response :success
  end

  test "should get edit" do
    get edit_propuest_url(@propuest)
    assert_response :success
  end

  test "should update propuest" do
    patch propuest_url(@propuest), params: { propuest: { cliente_id: @propuest.cliente_id, descripcion: @propuest.descripcion } }
    assert_redirected_to propuest_url(@propuest)
  end

  test "should destroy propuest" do
    assert_difference('Propuest.count', -1) do
      delete propuest_url(@propuest)
    end

    assert_redirected_to propuests_url
  end
end
