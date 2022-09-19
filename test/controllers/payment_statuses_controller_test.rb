require "test_helper"

class PaymentStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_status = payment_statuses(:one)
  end

  test "should get index" do
    get payment_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_status_url
    assert_response :success
  end

  test "should create payment_status" do
    assert_difference('PaymentStatus.count') do
      post payment_statuses_url, params: { payment_status: { student_id: @payment_status.student_id } }
    end

    assert_redirected_to payment_status_url(PaymentStatus.last)
  end

  test "should show payment_status" do
    get payment_status_url(@payment_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_status_url(@payment_status)
    assert_response :success
  end

  test "should update payment_status" do
    patch payment_status_url(@payment_status), params: { payment_status: { student_id: @payment_status.student_id } }
    assert_redirected_to payment_status_url(@payment_status)
  end

  test "should destroy payment_status" do
    assert_difference('PaymentStatus.count', -1) do
      delete payment_status_url(@payment_status)
    end

    assert_redirected_to payment_statuses_url
  end
end
