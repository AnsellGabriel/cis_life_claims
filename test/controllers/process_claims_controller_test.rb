require "test_helper"

class ProcessClaimsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @process_claim = process_claims(:one)
  end

  test "should get index" do
    get process_claims_url
    assert_response :success
  end

  test "should get new" do
    get new_process_claim_url
    assert_response :success
  end

  test "should create process_claim" do
    assert_difference("ProcessClaim.count") do
      post process_claims_url, params: { process_claim: { age: @process_claim.age, agent_id: @process_claim.agent_id, birthdate: @process_claim.birthdate, cause_id: @process_claim.cause_id, coop_branch_id: @process_claim.coop_branch_id, cooperative_id: @process_claim.cooperative_id, date_filed: @process_claim.date_filed, date_incident: @process_claim.date_incident, firstname: @process_claim.firstname, gender: @process_claim.gender, geo_barangay_id: @process_claim.geo_barangay_id, geo_municipality_id: @process_claim.geo_municipality_id, geo_province_id: @process_claim.geo_province_id, geo_region_id: @process_claim.geo_region_id, insure_type: @process_claim.insure_type, lastname: @process_claim.lastname, middlename: @process_claim.middlename, occupation: @process_claim.occupation, plan_id: @process_claim.plan_id, status: @process_claim.status, street: @process_claim.street, suffix: @process_claim.suffix, unit: @process_claim.unit } }
    end

    assert_redirected_to process_claim_url(ProcessClaim.last)
  end

  test "should show process_claim" do
    get process_claim_url(@process_claim)
    assert_response :success
  end

  test "should get edit" do
    get edit_process_claim_url(@process_claim)
    assert_response :success
  end

  test "should update process_claim" do
    patch process_claim_url(@process_claim), params: { process_claim: { age: @process_claim.age, agent_id: @process_claim.agent_id, birthdate: @process_claim.birthdate, cause_id: @process_claim.cause_id, coop_branch_id: @process_claim.coop_branch_id, cooperative_id: @process_claim.cooperative_id, date_filed: @process_claim.date_filed, date_incident: @process_claim.date_incident, firstname: @process_claim.firstname, gender: @process_claim.gender, geo_barangay_id: @process_claim.geo_barangay_id, geo_municipality_id: @process_claim.geo_municipality_id, geo_province_id: @process_claim.geo_province_id, geo_region_id: @process_claim.geo_region_id, insure_type: @process_claim.insure_type, lastname: @process_claim.lastname, middlename: @process_claim.middlename, occupation: @process_claim.occupation, plan_id: @process_claim.plan_id, status: @process_claim.status, street: @process_claim.street, suffix: @process_claim.suffix, unit: @process_claim.unit } }
    assert_redirected_to process_claim_url(@process_claim)
  end

  test "should destroy process_claim" do
    assert_difference("ProcessClaim.count", -1) do
      delete process_claim_url(@process_claim)
    end

    assert_redirected_to process_claims_url
  end
end
