require "test_helper"

class TontanControllerTest < ActionDispatch::IntegrationTest
  test "should get TontanFunction" do
    get tontan_TontanFunction_url
    assert_response :success
  end
end
