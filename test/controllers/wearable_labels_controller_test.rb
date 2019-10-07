require 'test_helper'

class WearableLabelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wearable_label = wearable_labels(:one)
  end

  test "should get index" do
    get wearable_labels_url, as: :json
    assert_response :success
  end

  test "should create wearable_label" do
    assert_difference('WearableLabel.count') do
      post wearable_labels_url, params: { wearable_label: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show wearable_label" do
    get wearable_label_url(@wearable_label), as: :json
    assert_response :success
  end

  test "should update wearable_label" do
    patch wearable_label_url(@wearable_label), params: { wearable_label: {  } }, as: :json
    assert_response 200
  end

  test "should destroy wearable_label" do
    assert_difference('WearableLabel.count', -1) do
      delete wearable_label_url(@wearable_label), as: :json
    end

    assert_response 204
  end
end
