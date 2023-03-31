require "test_helper"

class ClaimDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @claim_document = claim_documents(:one)
  end

  test "should get index" do
    get claim_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_claim_document_url
    assert_response :success
  end

  test "should create claim_document" do
    assert_difference("ClaimDocument.count") do
      post claim_documents_url, params: { claim_document: { document_id: @claim_document.document_id, process_claim_id: @claim_document.process_claim_id } }
    end

    assert_redirected_to claim_document_url(ClaimDocument.last)
  end

  test "should show claim_document" do
    get claim_document_url(@claim_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_claim_document_url(@claim_document)
    assert_response :success
  end

  test "should update claim_document" do
    patch claim_document_url(@claim_document), params: { claim_document: { document_id: @claim_document.document_id, process_claim_id: @claim_document.process_claim_id } }
    assert_redirected_to claim_document_url(@claim_document)
  end

  test "should destroy claim_document" do
    assert_difference("ClaimDocument.count", -1) do
      delete claim_document_url(@claim_document)
    end

    assert_redirected_to claim_documents_url
  end
end
