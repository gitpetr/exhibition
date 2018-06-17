require 'test_helper'

class UsersCabinetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_cabinet_index_url
    assert_response :success
  end

end
