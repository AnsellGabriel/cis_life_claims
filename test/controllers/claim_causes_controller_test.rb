require "test_helper"

class ClaimCausesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @claim_cause = claim_causes(:one)
  end

  test "should get index" do
    get claim_causes_url
    assert_response :success
  end

  test "should get new" do
    get new_claim_cause_url
    assert_response :success
  end

  test "should create claim_cause" do
    assert_difference("ClaimCause.count") do
      post claim_causes_url, params: { claim_cause: { acd: @claim_cause.acd, osccd: @claim_cause.osccd, process_claim_id: @claim_cause.process_claim_id, ucd: @claim_cause.ucd } }
    end

    assert_redirected_to claim_cause_url(ClaimCause.last)
  end

  test "should show claim_cause" do
    get claim_cause_url(@claim_cause)
    assert_response :success
  end

  test "should get edit" do
    get edit_claim_cause_url(@claim_cause)
    assert_response :success
  end

  test "should update claim_cause" do
    patch claim_cause_url(@claim_cause), params: { claim_cause: { acd: @claim_cause.acd, osccd: @claim_cause.osccd, process_claim_id: @claim_cause.process_claim_id, ucd: @claim_cause.ucd } }
    assert_redirected_to claim_cause_url(@claim_cause)
  end

  test "should destroy claim_cause" do
    assert_difference("ClaimCause.count", -1) do
      delete claim_cause_url(@claim_cause)
    end

    assert_redirected_to claim_causes_url
  end
end
