require 'test_helper'

class GyroscopesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gyroscope = gyroscopes(:one)
  end

  test "should get index" do
    get gyroscopes_url, as: :json
    assert_response :success
  end

  test "should create gyroscope" do
    assert_difference('Gyroscope.count') do
      post gyroscopes_url, params: { gyroscope: { x_value: @gyroscope.x_value, y: @gyroscope.y, z_value: @gyroscope.z_value } }, as: :json
    end

    assert_response 201
  end

  test "should show gyroscope" do
    get gyroscope_url(@gyroscope), as: :json
    assert_response :success
  end

  test "should update gyroscope" do
    patch gyroscope_url(@gyroscope), params: { gyroscope: { x_value: @gyroscope.x_value, y: @gyroscope.y, z_value: @gyroscope.z_value } }, as: :json
    assert_response 200
  end

  test "should destroy gyroscope" do
    assert_difference('Gyroscope.count', -1) do
      delete gyroscope_url(@gyroscope), as: :json
    end

    assert_response 204
  end
end
