require 'test_helper'

class CarePackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @care_package = care_packages(:one)
  end

  test "should get index" do
    get care_packages_url
    assert_response :success
  end

  test "should get new" do
    get new_care_package_url
    assert_response :success
  end

  test "should create care_package" do
    assert_difference('CarePackage.count') do
      post care_packages_url, params: { care_package: { price: @care_package.price, title: @care_package.title } }
    end

    assert_redirected_to care_package_url(CarePackage.last)
  end

  test "should show care_package" do
    get care_package_url(@care_package)
    assert_response :success
  end

  test "should get edit" do
    get edit_care_package_url(@care_package)
    assert_response :success
  end

  test "should update care_package" do
    patch care_package_url(@care_package), params: { care_package: { price: @care_package.price, title: @care_package.title } }
    assert_redirected_to care_package_url(@care_package)
  end

  test "should destroy care_package" do
    assert_difference('CarePackage.count', -1) do
      delete care_package_url(@care_package)
    end

    assert_redirected_to care_packages_url
  end
end
