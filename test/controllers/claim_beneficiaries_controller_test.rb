require "test_helper"

class ClaimBeneficiariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @claim_beneficiary = claim_beneficiaries(:one)
  end

  test "should get index" do
    get claim_beneficiaries_url
    assert_response :success
  end

  test "should get new" do
    get new_claim_beneficiary_url
    assert_response :success
  end

  test "should create claim_beneficiary" do
    assert_difference("ClaimBeneficiary.count") do
      post claim_beneficiaries_url, params: { claim_beneficiary: { birthdate: @claim_beneficiary.birthdate, name: @claim_beneficiary.name, process_claim_id: @claim_beneficiary.process_claim_id, relationship: @claim_beneficiary.relationship } }
    end

    assert_redirected_to claim_beneficiary_url(ClaimBeneficiary.last)
  end

  test "should show claim_beneficiary" do
    get claim_beneficiary_url(@claim_beneficiary)
    assert_response :success
  end

  test "should get edit" do
    get edit_claim_beneficiary_url(@claim_beneficiary)
    assert_response :success
  end

  test "should update claim_beneficiary" do
    patch claim_beneficiary_url(@claim_beneficiary), params: { claim_beneficiary: { birthdate: @claim_beneficiary.birthdate, name: @claim_beneficiary.name, process_claim_id: @claim_beneficiary.process_claim_id, relationship: @claim_beneficiary.relationship } }
    assert_redirected_to claim_beneficiary_url(@claim_beneficiary)
  end

  test "should destroy claim_beneficiary" do
    assert_difference("ClaimBeneficiary.count", -1) do
      delete claim_beneficiary_url(@claim_beneficiary)
    end

    assert_redirected_to claim_beneficiaries_url
  end
end
