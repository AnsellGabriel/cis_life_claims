require "application_system_test_case"

class ClaimBeneficiariesTest < ApplicationSystemTestCase
  setup do
    @claim_beneficiary = claim_beneficiaries(:one)
  end

  test "visiting the index" do
    visit claim_beneficiaries_url
    assert_selector "h1", text: "Claim beneficiaries"
  end

  test "should create claim beneficiary" do
    visit claim_beneficiaries_url
    click_on "New claim beneficiary"

    fill_in "Birthdate", with: @claim_beneficiary.birthdate
    fill_in "Name", with: @claim_beneficiary.name
    fill_in "Process claim", with: @claim_beneficiary.process_claim_id
    fill_in "Relationship", with: @claim_beneficiary.relationship
    click_on "Create Claim beneficiary"

    assert_text "Claim beneficiary was successfully created"
    click_on "Back"
  end

  test "should update Claim beneficiary" do
    visit claim_beneficiary_url(@claim_beneficiary)
    click_on "Edit this claim beneficiary", match: :first

    fill_in "Birthdate", with: @claim_beneficiary.birthdate
    fill_in "Name", with: @claim_beneficiary.name
    fill_in "Process claim", with: @claim_beneficiary.process_claim_id
    fill_in "Relationship", with: @claim_beneficiary.relationship
    click_on "Update Claim beneficiary"

    assert_text "Claim beneficiary was successfully updated"
    click_on "Back"
  end

  test "should destroy Claim beneficiary" do
    visit claim_beneficiary_url(@claim_beneficiary)
    click_on "Destroy this claim beneficiary", match: :first

    assert_text "Claim beneficiary was successfully destroyed"
  end
end
