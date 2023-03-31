require "application_system_test_case"

class ClaimDocumentsTest < ApplicationSystemTestCase
  setup do
    @claim_document = claim_documents(:one)
  end

  test "visiting the index" do
    visit claim_documents_url
    assert_selector "h1", text: "Claim documents"
  end

  test "should create claim document" do
    visit claim_documents_url
    click_on "New claim document"

    fill_in "Document", with: @claim_document.document_id
    fill_in "Process claim", with: @claim_document.process_claim_id
    click_on "Create Claim document"

    assert_text "Claim document was successfully created"
    click_on "Back"
  end

  test "should update Claim document" do
    visit claim_document_url(@claim_document)
    click_on "Edit this claim document", match: :first

    fill_in "Document", with: @claim_document.document_id
    fill_in "Process claim", with: @claim_document.process_claim_id
    click_on "Update Claim document"

    assert_text "Claim document was successfully updated"
    click_on "Back"
  end

  test "should destroy Claim document" do
    visit claim_document_url(@claim_document)
    click_on "Destroy this claim document", match: :first

    assert_text "Claim document was successfully destroyed"
  end
end
