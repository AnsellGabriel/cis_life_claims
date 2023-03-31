require "application_system_test_case"

class ClaimCausesTest < ApplicationSystemTestCase
  setup do
    @claim_cause = claim_causes(:one)
  end

  test "visiting the index" do
    visit claim_causes_url
    assert_selector "h1", text: "Claim causes"
  end

  test "should create claim cause" do
    visit claim_causes_url
    click_on "New claim cause"

    fill_in "Acd", with: @claim_cause.acd
    fill_in "Osccd", with: @claim_cause.osccd
    fill_in "Process claim", with: @claim_cause.process_claim_id
    fill_in "Ucd", with: @claim_cause.ucd
    click_on "Create Claim cause"

    assert_text "Claim cause was successfully created"
    click_on "Back"
  end

  test "should update Claim cause" do
    visit claim_cause_url(@claim_cause)
    click_on "Edit this claim cause", match: :first

    fill_in "Acd", with: @claim_cause.acd
    fill_in "Osccd", with: @claim_cause.osccd
    fill_in "Process claim", with: @claim_cause.process_claim_id
    fill_in "Ucd", with: @claim_cause.ucd
    click_on "Update Claim cause"

    assert_text "Claim cause was successfully updated"
    click_on "Back"
  end

  test "should destroy Claim cause" do
    visit claim_cause_url(@claim_cause)
    click_on "Destroy this claim cause", match: :first

    assert_text "Claim cause was successfully destroyed"
  end
end
