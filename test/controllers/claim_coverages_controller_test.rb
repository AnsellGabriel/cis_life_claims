require "test_helper"

class ClaimCoveragesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @claim_coverage = claim_coverages(:one)
  end

  test "should get index" do
    get claim_coverages_url
    assert_response :success
  end

  test "should get new" do
    get new_claim_coverage_url
    assert_response :success
  end

  test "should create claim_coverage" do
    assert_difference("ClaimCoverage.count") do
      post claim_coverages_url, params: { claim_coverage: { amount: @claim_coverage.amount, bs_date: @claim_coverage.bs_date, bsno: @claim_coverage.bsno, coverage_type: @claim_coverage.coverage_type, effectivity: @claim_coverage.effectivity, expiry: @claim_coverage.expiry, or_date: @claim_coverage.or_date, orno: @claim_coverage.orno, status: @claim_coverage.status } }
    end

    assert_redirected_to claim_coverage_url(ClaimCoverage.last)
  end

  test "should show claim_coverage" do
    get claim_coverage_url(@claim_coverage)
    assert_response :success
  end

  test "should get edit" do
    get edit_claim_coverage_url(@claim_coverage)
    assert_response :success
  end

  test "should update claim_coverage" do
    patch claim_coverage_url(@claim_coverage), params: { claim_coverage: { amount: @claim_coverage.amount, bs_date: @claim_coverage.bs_date, bsno: @claim_coverage.bsno, coverage_type: @claim_coverage.coverage_type, effectivity: @claim_coverage.effectivity, expiry: @claim_coverage.expiry, or_date: @claim_coverage.or_date, orno: @claim_coverage.orno, status: @claim_coverage.status } }
    assert_redirected_to claim_coverage_url(@claim_coverage)
  end

  test "should destroy claim_coverage" do
    assert_difference("ClaimCoverage.count", -1) do
      delete claim_coverage_url(@claim_coverage)
    end

    assert_redirected_to claim_coverages_url
  end
end
