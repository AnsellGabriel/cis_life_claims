require "application_system_test_case"

class ClaimRoutesTest < ApplicationSystemTestCase
  setup do
    @claim_route = claim_routes(:one)
  end

  test "visiting the index" do
    visit claim_routes_url
    assert_selector "h1", text: "Claim routes"
  end

  test "should create claim route" do
    visit claim_routes_url
    click_on "New claim route"

    fill_in "Description", with: @claim_route.description
    fill_in "Name", with: @claim_route.name
    click_on "Create Claim route"

    assert_text "Claim route was successfully created"
    click_on "Back"
  end

  test "should update Claim route" do
    visit claim_route_url(@claim_route)
    click_on "Edit this claim route", match: :first

    fill_in "Description", with: @claim_route.description
    fill_in "Name", with: @claim_route.name
    click_on "Update Claim route"

    assert_text "Claim route was successfully updated"
    click_on "Back"
  end

  test "should destroy Claim route" do
    visit claim_route_url(@claim_route)
    click_on "Destroy this claim route", match: :first

    assert_text "Claim route was successfully destroyed"
  end
end
