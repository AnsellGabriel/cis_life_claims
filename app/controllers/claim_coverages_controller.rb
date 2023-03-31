class ClaimCoveragesController < ApplicationController
  before_action :set_claim_coverage, only: %i[ show edit update destroy ]

  # GET /claim_coverages or /claim_coverages.json
  def index
    @claim_coverages = ClaimCoverage.all
  end

  # GET /claim_coverages/1 or /claim_coverages/1.json
  def show
  end

  # GET /claim_coverages/new
  def new
    # @claim_coverage = ClaimCoverage.new
    @process_claim = ProcessClaim.find(params[:v])
    @claim_coverage = @process_claim.claim_coverages.build
    set_default_value
  end

  def set_default_value 
    @claim_coverage.status = "Approve"
    @claim_coverage.coverage_type = "Current"
    @claim_coverage.orno = rand(200000..300000).to_s
    @claim_coverage.bsno = rand(10000..30000).to_s
  end
  # GET /claim_coverages/1/edit
  def edit
    @process_claim = ProcessClaim.find(@claim_coverage.process_claim_id)
  end

  # POST /claim_coverages or /claim_coverages.json
  def create
    @process_claim = ProcessClaim.find(params[:v])
    @claim_coverage = @process_claim.claim_coverages.build(claim_coverage_params)

    respond_to do |format|
      if @claim_coverage.save
        format.html { redirect_back fallback_location: @process_claim, notice: "Claim coverage was successfully created." }
        format.json { render :show, status: :created, location: @claim_coverage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @claim_coverage.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claim_coverages/1 or /claim_coverages/1.json
  def update
    @process_claim = ProcessClaim.find(@claim_coverage.process_claim_id)
    respond_to do |format|
      if @claim_coverage.update(claim_coverage_params)
        format.html { redirect_back fallback_location: @process_claim, notice: "Claim coverage was successfully updated." }
        format.json { render :show, status: :ok, location: @claim_coverage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @claim_coverage.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /claim_coverages/1 or /claim_coverages/1.json
  def destroy
    @claim_coverage.destroy

    respond_to do |format|
      format.html { redirect_to claim_coverages_url, notice: "Claim coverage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim_coverage
      @claim_coverage = ClaimCoverage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def claim_coverage_params
      params.require(:claim_coverage).permit(:orno, :or_date, :bsno, :bs_date, :effectivity, :expiry, :amount, :amount_cover, :coverage_type, :status, :process_claim_id)
    end
end
