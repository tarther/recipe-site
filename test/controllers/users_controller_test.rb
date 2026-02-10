require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get posts" do
    get users_posts_url
    assert_response :success
  end
end
