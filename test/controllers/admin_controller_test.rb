require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get load_term_data_form_json" do
    get admin_load_term_data_form_json_url
    assert_response :success
  end

  test "should get load_term_data_from_json_commit" do
    get admin_load_term_data_from_json_commit_url
    assert_response :success
  end

end
