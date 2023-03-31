require "application_system_test_case"

class ClaimCoveragesTest < ApplicationSystemTestCase
  setup do
    @claim_coverage = claim_coverages(:one)
  end

  test "visiting the index" do
    visit claim_coverages_url
    assert_selector "h1", text: "Claim coverages"
  end

  test "should create claim coverage" do
    visit claim_coverages_url
    click_on "New claim coverage"

    fill_in "Amount", with: @claim_coverage.amount
    fill_in "Bs date", with: @claim_coverage.bs_date
    fill_in "Bsno", with: @claim_coverage.bsno
    fill_in "Coverage type", with: @claim_coverage.coverage_type
    fill_in "Effectivity", with: @claim_coverage.effectivity
    fill_in "Expiry", with: @claim_coverage.expiry
    fill_in "Or date", with: @claim_coverage.or_date
    fill_in "Orno", with: @claim_coverage.orno
    fill_in "Status", with: @claim_coverage.status
    click_on "Create Claim coverage"

    assert_text "Claim coverage was successfully created"
    click_on "Back"
  end

  test "should update Claim coverage" do
    visit claim_coverage_url(@claim_coverage)
    click_on "Edit this claim coverage", match: :first

    fill_in "Amount", with: @claim_coverage.amount
    fill_in "Bs date", with: @claim_coverage.bs_date
    fill_in "Bsno", with: @claim_coverage.bsno
    fill_in "Coverage type", with: @claim_coverage.coverage_type
    fill_in "Effectivity", with: @claim_coverage.effectivity
    fill_in "Expiry", with: @claim_coverage.expiry
    fill_in "Or date", with: @claim_coverage.or_date
    fill_in "Orno", with: @claim_coverage.orno
    fill_in "Status", with: @claim_coverage.status
    click_on "Update Claim coverage"

    assert_text "Claim coverage was successfully updated"
    click_on "Back"
  end

  test "should destroy Claim coverage" do
    visit claim_coverage_url(@claim_coverage)
    click_on "Destroy this claim coverage", match: :first

    assert_text "Claim coverage was successfully destroyed"
  end
end
