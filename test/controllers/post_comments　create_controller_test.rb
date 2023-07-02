require "test_helper"

class PostComments　createControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get post_comments　create_destroy_url
    assert_response :success
  end
end
