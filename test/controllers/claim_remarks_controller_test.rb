require "test_helper"

class ClaimRemarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @claim_remark = claim_remarks(:one)
  end

  test "should get index" do
    get claim_remarks_url
    assert_response :success
  end

  test "should get new" do
    get new_claim_remark_url
    assert_response :success
  end

  test "should create claim_remark" do
    assert_difference("ClaimRemark.count") do
      post claim_remarks_url, params: { claim_remark: { process_claim_id: @claim_remark.process_claim_id, remarks: @claim_remark.remarks, status: @claim_remark.status, user: @claim_remark.user } }
    end

    assert_redirected_to claim_remark_url(ClaimRemark.last)
  end

  test "should show claim_remark" do
    get claim_remark_url(@claim_remark)
    assert_response :success
  end

  test "should get edit" do
    get edit_claim_remark_url(@claim_remark)
    assert_response :success
  end

  test "should update claim_remark" do
    patch claim_remark_url(@claim_remark), params: { claim_remark: { process_claim_id: @claim_remark.process_claim_id, remarks: @claim_remark.remarks, status: @claim_remark.status, user: @claim_remark.user } }
    assert_redirected_to claim_remark_url(@claim_remark)
  end

  test "should destroy claim_remark" do
    assert_difference("ClaimRemark.count", -1) do
      delete claim_remark_url(@claim_remark)
    end

    assert_redirected_to claim_remarks_url
  end
end
