require "test_helper"

class ClaimConfinementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @claim_confinement = claim_confinements(:one)
  end

  test "should get index" do
    get claim_confinements_url
    assert_response :success
  end

  test "should get new" do
    get new_claim_confinement_url
    assert_response :success
  end

  test "should create claim_confinement" do
    assert_difference("ClaimConfinement.count") do
      post claim_confinements_url, params: { claim_confinement: { amount: @claim_confinement.amount, date_admit: @claim_confinement.date_admit, date_discharge: @claim_confinement.date_discharge } }
    end

    assert_redirected_to claim_confinement_url(ClaimConfinement.last)
  end

  test "should show claim_confinement" do
    get claim_confinement_url(@claim_confinement)
    assert_response :success
  end

  test "should get edit" do
    get edit_claim_confinement_url(@claim_confinement)
    assert_response :success
  end

  test "should update claim_confinement" do
    patch claim_confinement_url(@claim_confinement), params: { claim_confinement: { amount: @claim_confinement.amount, date_admit: @claim_confinement.date_admit, date_discharge: @claim_confinement.date_discharge } }
    assert_redirected_to claim_confinement_url(@claim_confinement)
  end

  test "should destroy claim_confinement" do
    assert_difference("ClaimConfinement.count", -1) do
      delete claim_confinement_url(@claim_confinement)
    end

    assert_redirected_to claim_confinements_url
  end
end
