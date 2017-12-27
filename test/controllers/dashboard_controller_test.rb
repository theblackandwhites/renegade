require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get billing" do
    get dashboard_billing_url
    assert_response :success
  end

  test "should get sponsored_missions" do
    get dashboard_sponsored_missions_url
    assert_response :success
  end

end
