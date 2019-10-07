require 'test_helper'

class AccelerometersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accelerometer = accelerometers(:one)
  end

  test "should get index" do
    get accelerometers_url, as: :json
    assert_response :success
  end

  test "should create accelerometer" do
    assert_difference('Accelerometer.count') do
      post accelerometers_url, params: { accelerometer: { x_value: @accelerometer.x_value, y: @accelerometer.y, z_value: @accelerometer.z_value } }, as: :json
    end

    assert_response 201
  end

  test "should show accelerometer" do
    get accelerometer_url(@accelerometer), as: :json
    assert_response :success
  end

  test "should update accelerometer" do
    patch accelerometer_url(@accelerometer), params: { accelerometer: { x_value: @accelerometer.x_value, y: @accelerometer.y, z_value: @accelerometer.z_value } }, as: :json
    assert_response 200
  end

  test "should destroy accelerometer" do
    assert_difference('Accelerometer.count', -1) do
      delete accelerometer_url(@accelerometer), as: :json
    end

    assert_response 204
  end
end
