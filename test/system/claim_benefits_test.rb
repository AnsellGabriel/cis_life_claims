require "application_system_test_case"

class ClaimBenefitsTest < ApplicationSystemTestCase
  setup do
    @claim_benefit = claim_benefits(:one)
  end

  test "visiting the index" do
    visit claim_benefits_url
    assert_selector "h1", text: "Claim benefits"
  end

  test "should create claim benefit" do
    visit claim_benefits_url
    click_on "New claim benefit"

    fill_in "Amount", with: @claim_benefit.amount
    fill_in "Benefit", with: @claim_benefit.benefit_id
    fill_in "Process claim", with: @claim_benefit.process_claim_id
    fill_in "Status", with: @claim_benefit.status
    click_on "Create Claim benefit"

    assert_text "Claim benefit was successfully created"
    click_on "Back"
  end

  test "should update Claim benefit" do
    visit claim_benefit_url(@claim_benefit)
    click_on "Edit this claim benefit", match: :first

    fill_in "Amount", with: @claim_benefit.amount
    fill_in "Benefit", with: @claim_benefit.benefit_id
    fill_in "Process claim", with: @claim_benefit.process_claim_id
    fill_in "Status", with: @claim_benefit.status
    click_on "Update Claim benefit"

    assert_text "Claim benefit was successfully updated"
    click_on "Back"
  end

  test "should destroy Claim benefit" do
    visit claim_benefit_url(@claim_benefit)
    click_on "Destroy this claim benefit", match: :first

    assert_text "Claim benefit was successfully destroyed"
  end
end
