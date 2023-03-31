class ClaimDocumentsController < ApplicationController
  before_action :set_claim_document, only: %i[ show edit update destroy ]

  # GET /claim_documents or /claim_documents.json
  def index
    @claim_documents = ClaimDocument.all
  end

  # GET /claim_documents/1 or /claim_documents/1.json
  def show
  end

  # GET /claim_documents/new
  def new
    # @claim_document = ClaimDocument.new
    @process_claim = ProcessClaim.find(params[:v])
    @claim_document = @process_claim.claim_documents.build
  end

  # GET /claim_documents/1/edit
  def edit
  end

  # POST /claim_documents or /claim_documents.json
  def create
    # @claim_document = ClaimDocument.new(claim_document_params)
    @process_claim = ProcessClaim.find(params[:v])
    @claim_document = @process_claim.claim_documents.build(claim_document_params)

    respond_to do |format|
      if @claim_document.save
        format.html { redirect_back fallback_location: @process_claim, notice: "Claim document was successfully created." }
        format.json { render :show, status: :created, location: @claim_document }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @claim_document.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claim_documents/1 or /claim_documents/1.json
  def update
    respond_to do |format|
      if @claim_document.update(claim_document_params)
        format.html { redirect_back fallback_location: @process_claim, notice: "Claim document was successfully updated." }
        format.json { render :show, status: :ok, location: @claim_document }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @claim_document.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /claim_documents/1 or /claim_documents/1.json
  def destroy
    @claim_document.destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: @process_claim, notice: "Claim document was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim_document
      @claim_document = ClaimDocument.find(params[:id])
      @process_claim = ProcessClaim.find(@claim_document.process_claim_id)
    end

    # Only allow a list of trusted parameters through.
    def claim_document_params
      params.require(:claim_document).permit(:process_claim_id, :document_id, :file)
    end
end
