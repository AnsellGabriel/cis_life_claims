require "test_helper"

class ClaimDistributionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @claim_distribution = claim_distributions(:one)
  end

  test "should get index" do
    get claim_distributions_url
    assert_response :success
  end

  test "should get new" do
    get new_claim_distribution_url
    assert_response :success
  end

  test "should create claim_distribution" do
    assert_difference("ClaimDistribution.count") do
      post claim_distributions_url, params: { claim_distribution: { amount: @claim_distribution.amount, amount_type: @claim_distribution.amount_type, name: @claim_distribution.name, process_claim_id: @claim_distribution.process_claim_id } }
    end

    assert_redirected_to claim_distribution_url(ClaimDistribution.last)
  end

  test "should show claim_distribution" do
    get claim_distribution_url(@claim_distribution)
    assert_response :success
  end

  test "should get edit" do
    get edit_claim_distribution_url(@claim_distribution)
    assert_response :success
  end

  test "should update claim_distribution" do
    patch claim_distribution_url(@claim_distribution), params: { claim_distribution: { amount: @claim_distribution.amount, amount_type: @claim_distribution.amount_type, name: @claim_distribution.name, process_claim_id: @claim_distribution.process_claim_id } }
    assert_redirected_to claim_distribution_url(@claim_distribution)
  end

  test "should destroy claim_distribution" do
    assert_difference("ClaimDistribution.count", -1) do
      delete claim_distribution_url(@claim_distribution)
    end

    assert_redirected_to claim_distributions_url
  end
end
