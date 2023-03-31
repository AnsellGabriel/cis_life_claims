require "application_system_test_case"

class ProcessClaimsTest < ApplicationSystemTestCase
  setup do
    @process_claim = process_claims(:one)
  end

  test "visiting the index" do
    visit process_claims_url
    assert_selector "h1", text: "Process claims"
  end

  test "should create process claim" do
    visit process_claims_url
    click_on "New process claim"

    fill_in "Age", with: @process_claim.age
    fill_in "Agent", with: @process_claim.agent_id
    fill_in "Birthdate", with: @process_claim.birthdate
    fill_in "Cause", with: @process_claim.cause_id
    fill_in "Coop branch", with: @process_claim.coop_branch_id
    fill_in "Cooperative", with: @process_claim.cooperative_id
    fill_in "Date filed", with: @process_claim.date_filed
    fill_in "Date incident", with: @process_claim.date_incident
    fill_in "Firstname", with: @process_claim.firstname
    fill_in "Gender", with: @process_claim.gender
    fill_in "Geo barangay", with: @process_claim.geo_barangay_id
    fill_in "Geo municipality", with: @process_claim.geo_municipality_id
    fill_in "Geo province", with: @process_claim.geo_province_id
    fill_in "Geo region", with: @process_claim.geo_region_id
    fill_in "Insure type", with: @process_claim.insure_type
    fill_in "Lastname", with: @process_claim.lastname
    fill_in "Middlename", with: @process_claim.middlename
    fill_in "Occupation", with: @process_claim.occupation
    fill_in "Plan", with: @process_claim.plan_id
    fill_in "Status", with: @process_claim.status
    fill_in "Street", with: @process_claim.street
    fill_in "Suffix", with: @process_claim.suffix
    fill_in "Unit", with: @process_claim.unit
    click_on "Create Process claim"

    assert_text "Process claim was successfully created"
    click_on "Back"
  end

  test "should update Process claim" do
    visit process_claim_url(@process_claim)
    click_on "Edit this process claim", match: :first

    fill_in "Age", with: @process_claim.age
    fill_in "Agent", with: @process_claim.agent_id
    fill_in "Birthdate", with: @process_claim.birthdate
    fill_in "Cause", with: @process_claim.cause_id
    fill_in "Coop branch", with: @process_claim.coop_branch_id
    fill_in "Cooperative", with: @process_claim.cooperative_id
    fill_in "Date filed", with: @process_claim.date_filed
    fill_in "Date incident", with: @process_claim.date_incident
    fill_in "Firstname", with: @process_claim.firstname
    fill_in "Gender", with: @process_claim.gender
    fill_in "Geo barangay", with: @process_claim.geo_barangay_id
    fill_in "Geo municipality", with: @process_claim.geo_municipality_id
    fill_in "Geo province", with: @process_claim.geo_province_id
    fill_in "Geo region", with: @process_claim.geo_region_id
    fill_in "Insure type", with: @process_claim.insure_type
    fill_in "Lastname", with: @process_claim.lastname
    fill_in "Middlename", with: @process_claim.middlename
    fill_in "Occupation", with: @process_claim.occupation
    fill_in "Plan", with: @process_claim.plan_id
    fill_in "Status", with: @process_claim.status
    fill_in "Street", with: @process_claim.street
    fill_in "Suffix", with: @process_claim.suffix
    fill_in "Unit", with: @process_claim.unit
    click_on "Update Process claim"

    assert_text "Process claim was successfully updated"
    click_on "Back"
  end

  test "should destroy Process claim" do
    visit process_claim_url(@process_claim)
    click_on "Destroy this process claim", match: :first

    assert_text "Process claim was successfully destroyed"
  end
end
