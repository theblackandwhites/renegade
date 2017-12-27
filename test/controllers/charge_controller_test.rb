require 'test_helper'

class ChargeControllerTest < ActionDispatch::IntegrationTest
  test "should get make_charge" do
    get charge_make_charge_url
    assert_response :success
  end

  test "should get assign_to_mission" do
    get charge_assign_to_mission_url
    assert_response :success
  end

  test "should get thank_you" do
    get charge_thank_you_url
    assert_response :success
  end

end
