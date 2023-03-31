require "test_helper"

class ClaimRoutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @claim_route = claim_routes(:one)
  end

  test "should get index" do
    get claim_routes_url
    assert_response :success
  end

  test "should get new" do
    get new_claim_route_url
    assert_response :success
  end

  test "should create claim_route" do
    assert_difference("ClaimRoute.count") do
      post claim_routes_url, params: { claim_route: { description: @claim_route.description, name: @claim_route.name } }
    end

    assert_redirected_to claim_route_url(ClaimRoute.last)
  end

  test "should show claim_route" do
    get claim_route_url(@claim_route)
    assert_response :success
  end

  test "should get edit" do
    get edit_claim_route_url(@claim_route)
    assert_response :success
  end

  test "should update claim_route" do
    patch claim_route_url(@claim_route), params: { claim_route: { description: @claim_route.description, name: @claim_route.name } }
    assert_redirected_to claim_route_url(@claim_route)
  end

  test "should destroy claim_route" do
    assert_difference("ClaimRoute.count", -1) do
      delete claim_route_url(@claim_route)
    end

    assert_redirected_to claim_routes_url
  end
end
