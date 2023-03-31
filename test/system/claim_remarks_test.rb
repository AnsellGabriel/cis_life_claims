require "application_system_test_case"

class ClaimRemarksTest < ApplicationSystemTestCase
  setup do
    @claim_remark = claim_remarks(:one)
  end

  test "visiting the index" do
    visit claim_remarks_url
    assert_selector "h1", text: "Claim remarks"
  end

  test "should create claim remark" do
    visit claim_remarks_url
    click_on "New claim remark"

    fill_in "Process claim", with: @claim_remark.process_claim_id
    fill_in "Remarks", with: @claim_remark.remarks
    fill_in "Status", with: @claim_remark.status
    fill_in "User", with: @claim_remark.user
    click_on "Create Claim remark"

    assert_text "Claim remark was successfully created"
    click_on "Back"
  end

  test "should update Claim remark" do
    visit claim_remark_url(@claim_remark)
    click_on "Edit this claim remark", match: :first

    fill_in "Process claim", with: @claim_remark.process_claim_id
    fill_in "Remarks", with: @claim_remark.remarks
    fill_in "Status", with: @claim_remark.status
    fill_in "User", with: @claim_remark.user
    click_on "Update Claim remark"

    assert_text "Claim remark was successfully updated"
    click_on "Back"
  end

  test "should destroy Claim remark" do
    visit claim_remark_url(@claim_remark)
    click_on "Destroy this claim remark", match: :first

    assert_text "Claim remark was successfully destroyed"
  end
end
