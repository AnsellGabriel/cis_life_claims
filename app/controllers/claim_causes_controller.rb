class ClaimCausesController < ApplicationController
  before_action :set_claim_cause, only: %i[ show edit update destroy ]

  # GET /claim_causes or /claim_causes.json
  def index
    @claim_causes = ClaimCause.all
  end

  # GET /claim_causes/1 or /claim_causes/1.json
  def show
  end

  # GET /claim_causes/new
  def new
    @claim_cause = ClaimCause.new
  end

  # GET /claim_causes/1/edit
  def edit
  end

  # POST /claim_causes or /claim_causes.json
  def create
    @claim_cause = ClaimCause.new(claim_cause_params)

    respond_to do |format|
      if @claim_cause.save
        format.html { redirect_to claim_cause_url(@claim_cause), notice: "Claim cause was successfully created." }
        format.json { render :show, status: :created, location: @claim_cause }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @claim_cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claim_causes/1 or /claim_causes/1.json
  def update
    respond_to do |format|
      if @claim_cause.update(claim_cause_params)
        format.html { redirect_to claim_cause_url(@claim_cause), notice: "Claim cause was successfully updated." }
        format.json { render :show, status: :ok, location: @claim_cause }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @claim_cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /claim_causes/1 or /claim_causes/1.json
  def destroy
    @claim_cause.destroy

    respond_to do |format|
      format.html { redirect_to claim_causes_url, notice: "Claim cause was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim_cause
      @claim_cause = ClaimCause.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def claim_cause_params
      params.require(:claim_cause).permit(:acd, :ucd, :osccd, :icd, :process_claim_id)
    end
end
