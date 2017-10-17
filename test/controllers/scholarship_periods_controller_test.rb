require 'test_helper'

class ScholarshipPeriodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scholarship_period = scholarship_periods(:one)
  end

  test "should get index" do
    get scholarship_periods_url
    assert_response :success
  end

  test "should get new" do
    get new_scholarship_period_url
    assert_response :success
  end

  test "should create scholarship_period" do
    assert_difference('ScholarshipPeriod.count') do
      post scholarship_periods_url, params: { scholarship_period: { begin: @scholarship_period.begin, end: @scholarship_period.end } }
    end

    assert_redirected_to scholarship_period_url(ScholarshipPeriod.last)
  end

  test "should show scholarship_period" do
    get scholarship_period_url(@scholarship_period)
    assert_response :success
  end

  test "should get edit" do
    get edit_scholarship_period_url(@scholarship_period)
    assert_response :success
  end

  test "should update scholarship_period" do
    patch scholarship_period_url(@scholarship_period), params: { scholarship_period: { begin: @scholarship_period.begin, end: @scholarship_period.end } }
    assert_redirected_to scholarship_period_url(@scholarship_period)
  end

  test "should destroy scholarship_period" do
    assert_difference('ScholarshipPeriod.count', -1) do
      delete scholarship_period_url(@scholarship_period)
    end

    assert_redirected_to scholarship_periods_url
  end
end
