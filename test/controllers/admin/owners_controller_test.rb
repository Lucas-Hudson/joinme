require 'test_helper'

class Admin::OwnersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_owners_index_url
    assert_response :success
  end

  test "should get update" do
    get admin_owners_update_url
    assert_response :success
  end

end
