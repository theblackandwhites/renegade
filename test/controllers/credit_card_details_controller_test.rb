require 'test_helper'

class CreditCardDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get update_card" do
    get credit_card_details_update_card_url
    assert_response :success
  end

  test "should get destroy_card" do
    get credit_card_details_destroy_card_url
    assert_response :success
  end

end
