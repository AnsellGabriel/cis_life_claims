require "test_helper"

class ClaimBenefitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @claim_benefit = claim_benefits(:one)
  end

  test "should get index" do
    get claim_benefits_url
    assert_response :success
  end

  test "should get new" do
    get new_claim_benefit_url
    assert_response :success
  end

  test "should create claim_benefit" do
    assert_difference("ClaimBenefit.count") do
      post claim_benefits_url, params: { claim_benefit: { amount: @claim_benefit.amount, benefit_id: @claim_benefit.benefit_id, process_claim_id: @claim_benefit.process_claim_id, status: @claim_benefit.status } }
    end

    assert_redirected_to claim_benefit_url(ClaimBenefit.last)
  end

  test "should show claim_benefit" do
    get claim_benefit_url(@claim_benefit)
    assert_response :success
  end

  test "should get edit" do
    get edit_claim_benefit_url(@claim_benefit)
    assert_response :success
  end

  test "should update claim_benefit" do
    patch claim_benefit_url(@claim_benefit), params: { claim_benefit: { amount: @claim_benefit.amount, benefit_id: @claim_benefit.benefit_id, process_claim_id: @claim_benefit.process_claim_id, status: @claim_benefit.status } }
    assert_redirected_to claim_benefit_url(@claim_benefit)
  end

  test "should destroy claim_benefit" do
    assert_difference("ClaimBenefit.count", -1) do
      delete claim_benefit_url(@claim_benefit)
    end

    assert_redirected_to claim_benefits_url
  end
end
