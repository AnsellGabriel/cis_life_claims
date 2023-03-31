class ClaimConfinementsController < ApplicationController
  before_action :set_claim_confinement, only: %i[ show edit update destroy ]

  # GET /claim_confinements or /claim_confinements.json
  def index
    @claim_confinements = ClaimConfinement.all
  end

  # GET /claim_confinements/1 or /claim_confinements/1.json
  def show
  end

  # GET /claim_confinements/new
  def new
    # @claim_confinement = ClaimConfinement.new
    @process_claim = ProcessClaim.find(params[:v])
    @claim_confinement = @process_claim.claim_confinements.build
  end

  # GET /claim_confinements/1/edit
  def edit
    @process_claim = ProcessClaim.find(@claim_confinement.process_claim_id)
  end

  # POST /claim_confinements or /claim_confinements.json
  def create
    # @claim_confinement = ClaimConfinement.new(claim_confinement_params)
    @process_claim = ProcessClaim.find(params[:v])
    @claim_confinement = @process_claim.claim_confinements.build(claim_confinement_params)
    @claim_confinement.amount = @claim_confinement.amount_confinement
    respond_to do |format|
      if @claim_confinement.save
        # format.html { redirect_to claim_confinement_url(@claim_confinement), notice: "Claim confinement was successfully created." }
        format.html { redirect_back fallback_location: @process_claim, notice: "Claim confinement was successfully created." }
        format.json { render :show, status: :created, location: @claim_confinement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @claim_confinement.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claim_confinements/1 or /claim_confinements/1.json
  def update
    @process_claim = ProcessClaim.find(@claim_confinement.process_claim_id)
    respond_to do |format|
      if @claim_confinement.update(claim_confinement_params)
        # format.html { redirect_to claim_confinement_url(@claim_confinement), notice: "Claim confinement was successfully updated." }
        format.html { redirect_back fallback_location: @process_claim, notice: "Claim confinement was successfully updated." }
        format.json { render :show, status: :ok, location: @claim_confinement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @claim_confinement.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /claim_confinements/1 or /claim_confinements/1.json
  def destroy
    @process_claim = ProcessClaim.find(@claim_confinement.process_claim_id)
    @claim_confinement.destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: @process_claim, notice: "Claim confinement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim_confinement
      @claim_confinement = ClaimConfinement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def claim_confinement_params
      params.require(:claim_confinement).permit(:date_admit, :date_discharge, :amount)
    end
end
