require "application_system_test_case"

class ClaimDistributionsTest < ApplicationSystemTestCase
  setup do
    @claim_distribution = claim_distributions(:one)
  end

  test "visiting the index" do
    visit claim_distributions_url
    assert_selector "h1", text: "Claim distributions"
  end

  test "should create claim distribution" do
    visit claim_distributions_url
    click_on "New claim distribution"

    fill_in "Amount", with: @claim_distribution.amount
    fill_in "Amount type", with: @claim_distribution.amount_type
    fill_in "Name", with: @claim_distribution.name
    fill_in "Process claim", with: @claim_distribution.process_claim_id
    click_on "Create Claim distribution"

    assert_text "Claim distribution was successfully created"
    click_on "Back"
  end

  test "should update Claim distribution" do
    visit claim_distribution_url(@claim_distribution)
    click_on "Edit this claim distribution", match: :first

    fill_in "Amount", with: @claim_distribution.amount
    fill_in "Amount type", with: @claim_distribution.amount_type
    fill_in "Name", with: @claim_distribution.name
    fill_in "Process claim", with: @claim_distribution.process_claim_id
    click_on "Update Claim distribution"

    assert_text "Claim distribution was successfully updated"
    click_on "Back"
  end

  test "should destroy Claim distribution" do
    visit claim_distribution_url(@claim_distribution)
    click_on "Destroy this claim distribution", match: :first

    assert_text "Claim distribution was successfully destroyed"
  end
end
