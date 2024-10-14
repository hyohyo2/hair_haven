require "test_helper"

class Admin::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get form" do
    get admin_searches_form_url
    assert_response :success
  end

  test "should get result" do
    get admin_searches_result_url
    assert_response :success
  end
end
