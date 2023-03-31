require "application_system_test_case"

class CoopBranchesTest < ApplicationSystemTestCase
  setup do
    @coop_branch = coop_branches(:one)
  end

  test "visiting the index" do
    visit coop_branches_url
    assert_selector "h1", text: "Coop branches"
  end

  test "should create coop branch" do
    visit coop_branches_url
    click_on "New coop branch"

    fill_in "Address", with: @coop_branch.address
    fill_in "Cooperative", with: @coop_branch.cooperative_id
    fill_in "Name", with: @coop_branch.name
    click_on "Create Coop branch"

    assert_text "Coop branch was successfully created"
    click_on "Back"
  end

  test "should update Coop branch" do
    visit coop_branch_url(@coop_branch)
    click_on "Edit this coop branch", match: :first

    fill_in "Address", with: @coop_branch.address
    fill_in "Cooperative", with: @coop_branch.cooperative_id
    fill_in "Name", with: @coop_branch.name
    click_on "Update Coop branch"

    assert_text "Coop branch was successfully updated"
    click_on "Back"
  end

  test "should destroy Coop branch" do
    visit coop_branch_url(@coop_branch)
    click_on "Destroy this coop branch", match: :first

    assert_text "Coop branch was successfully destroyed"
  end
end
