class ClaimDistributionsController < ApplicationController
  before_action :set_claim_distribution, only: %i[ show edit update destroy ]

  # GET /claim_distributions or /claim_distributions.json
  def index
    @claim_distributions = ClaimDistribution.all
  end

  # GET /claim_distributions/1 or /claim_distributions/1.json
  def show
  end

  # GET /claim_distributions/new
  def new
    @process_claim = ProcessClaim.find(params[:v])
    @claim_distribution = @process_claim.claim_distributions.build
    set_dummy_value
  end
  
  def set_dummy_value 
    @claim_distribution.name = FFaker::Name.name
  end

  # GET /claim_distributions/1/edit
  def edit
    @process_claim = ProcessClaim.find(@claim_distribution.process_claim_id)
  end

  # POST /claim_distributions or /claim_distributions.json
  def create
    # @claim_distribution = ClaimDistribution.new(claim_distribution_params)
    @process_claim = ProcessClaim.find(params[:v])
    @claim_distribution = @process_claim.claim_distributions.build(claim_distribution_params)
    respond_to do |format|
      if @claim_distribution.save
        # format.html { redirect_to claim_distribution_url(@claim_distribution), notice: "Claim distribution was successfully created." }
        format.html { redirect_back fallback_location: @process_claim, notice: "Claim beneficiary was successfully created." }
        format.json { render :show, status: :created, location: @claim_distribution }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @claim_distribution.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claim_distributions/1 or /claim_distributions/1.json
  def update
    @process_claim = ProcessClaim.find(@claim_distribution.process_claim_id)
    respond_to do |format|
      if @claim_distribution.update(claim_distribution_params)
        # format.html { redirect_to claim_distribution_url(@claim_distribution), notice: "Claim distribution was successfully updated." }
        format.html { redirect_back fallback_location: @process_claim, notice: "Claim beneficiary was successfully updated." }
        format.json { render :show, status: :ok, location: @claim_distribution }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @claim_distribution.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /claim_distributions/1 or /claim_distributions/1.json
  def destroy
    @process_claim = ProcessClaim.find(@claim_distribution.process_claim_id)
    @claim_distribution.destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: @process_claim, notice: "Claim distribution was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim_distribution
      @claim_distribution = ClaimDistribution.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def claim_distribution_params
      params.require(:claim_distribution).permit(:process_claim_id, :name, :amount_type, :amount)
    end
end
