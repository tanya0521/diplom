require 'test_helper'

class PerformDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @perform_datum = perform_data(:one)
  end

  test "should get index" do
    get perform_data_url
    assert_response :success
  end

  test "should get new" do
    get new_perform_datum_url
    assert_response :success
  end

  test "should create perform_datum" do
    assert_difference('PerformDatum.count') do
      post perform_data_url, params: { perform_datum: { quantity2: @perform_datum.quantity2, quantity3: @perform_datum.quantity3, quantity4: @perform_datum.quantity4, quantity5: @perform_datum.quantity5, scholarship_period_id: @perform_datum.scholarship_period_id, student_id: @perform_datum.student_id } }
    end

    assert_redirected_to perform_datum_url(PerformDatum.last)
  end

  test "should show perform_datum" do
    get perform_datum_url(@perform_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_perform_datum_url(@perform_datum)
    assert_response :success
  end

  test "should update perform_datum" do
    patch perform_datum_url(@perform_datum), params: { perform_datum: { quantity2: @perform_datum.quantity2, quantity3: @perform_datum.quantity3, quantity4: @perform_datum.quantity4, quantity5: @perform_datum.quantity5, scholarship_period_id: @perform_datum.scholarship_period_id, student_id: @perform_datum.student_id } }
    assert_redirected_to perform_datum_url(@perform_datum)
  end

  test "should destroy perform_datum" do
    assert_difference('PerformDatum.count', -1) do
      delete perform_datum_url(@perform_datum)
    end

    assert_redirected_to perform_data_url
  end
end
