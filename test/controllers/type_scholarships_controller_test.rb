require 'test_helper'

class TypeScholarshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_scholarship = type_scholarships(:one)
  end

  test "should get index" do
    get type_scholarships_url
    assert_response :success
  end

  test "should get new" do
    get new_type_scholarship_url
    assert_response :success
  end

  test "should create type_scholarship" do
    assert_difference('TypeScholarship.count') do
      post type_scholarships_url, params: { type_scholarship: { name_financing: @type_scholarship.name_financing, typescholarship: @type_scholarship.typescholarship } }
    end

    assert_redirected_to type_scholarship_url(TypeScholarship.last)
  end

  test "should show type_scholarship" do
    get type_scholarship_url(@type_scholarship)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_scholarship_url(@type_scholarship)
    assert_response :success
  end

  test "should update type_scholarship" do
    patch type_scholarship_url(@type_scholarship), params: { type_scholarship: { name_financing: @type_scholarship.name_financing, typescholarship: @type_scholarship.typescholarship } }
    assert_redirected_to type_scholarship_url(@type_scholarship)
  end

  test "should destroy type_scholarship" do
    assert_difference('TypeScholarship.count', -1) do
      delete type_scholarship_url(@type_scholarship)
    end

    assert_redirected_to type_scholarships_url
  end
end
