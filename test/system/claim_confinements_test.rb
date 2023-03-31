require "application_system_test_case"

class ClaimConfinementsTest < ApplicationSystemTestCase
  setup do
    @claim_confinement = claim_confinements(:one)
  end

  test "visiting the index" do
    visit claim_confinements_url
    assert_selector "h1", text: "Claim confinements"
  end

  test "should create claim confinement" do
    visit claim_confinements_url
    click_on "New claim confinement"

    fill_in "Amount", with: @claim_confinement.amount
    fill_in "Date admit", with: @claim_confinement.date_admit
    fill_in "Date discharge", with: @claim_confinement.date_discharge
    click_on "Create Claim confinement"

    assert_text "Claim confinement was successfully created"
    click_on "Back"
  end

  test "should update Claim confinement" do
    visit claim_confinement_url(@claim_confinement)
    click_on "Edit this claim confinement", match: :first

    fill_in "Amount", with: @claim_confinement.amount
    fill_in "Date admit", with: @claim_confinement.date_admit
    fill_in "Date discharge", with: @claim_confinement.date_discharge
    click_on "Update Claim confinement"

    assert_text "Claim confinement was successfully updated"
    click_on "Back"
  end

  test "should destroy Claim confinement" do
    visit claim_confinement_url(@claim_confinement)
    click_on "Destroy this claim confinement", match: :first

    assert_text "Claim confinement was successfully destroyed"
  end
end
