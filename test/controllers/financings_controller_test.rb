require 'test_helper'

class FinancingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @financing = financings(:one)
  end

  test "should get index" do
    get financings_url
    assert_response :success
  end

  test "should get new" do
    get new_financing_url
    assert_response :success
  end

  test "should create financing" do
    assert_difference('Financing.count') do
      post financings_url, params: { financing: { faculty_id: @financing.faculty_id, name_financing: @financing.name_financing, scholarship_period_id: @financing.scholarship_period_id, suum: @financing.suum, type_scholarship_id: @financing.type_scholarship_id } }
    end

    assert_redirected_to financing_url(Financing.last)
  end

  test "should show financing" do
    get financing_url(@financing)
    assert_response :success
  end

  test "should get edit" do
    get edit_financing_url(@financing)
    assert_response :success
  end

  test "should update financing" do
    patch financing_url(@financing), params: { financing: { faculty_id: @financing.faculty_id, name_financing: @financing.name_financing, scholarship_period_id: @financing.scholarship_period_id, suum: @financing.suum, type_scholarship_id: @financing.type_scholarship_id } }
    assert_redirected_to financing_url(@financing)
  end

  test "should destroy financing" do
    assert_difference('Financing.count', -1) do
      delete financing_url(@financing)
    end

    assert_redirected_to financings_url
  end
end
