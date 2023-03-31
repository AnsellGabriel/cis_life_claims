class ClaimBeneficiariesController < ApplicationController
  before_action :set_claim_beneficiary, only: %i[ show edit update destroy ]

  # GET /claim_beneficiaries or /claim_beneficiaries.json
  def index
    @claim_beneficiaries = ClaimBeneficiary.all
  end

  # GET /claim_beneficiaries/1 or /claim_beneficiaries/1.json
  def show
  end

  # GET /claim_beneficiaries/new
  def new
    # @claim_beneficiary = ClaimBeneficiary.new
    @process_claim = ProcessClaim.find(params[:v])
    @claim_beneficiary = @process_claim.claim_beneficiaries.build
    set_dummy_value
  end

  def set_dummy_value 
    @claim_beneficiary.name = FFaker::Name.name
    @claim_beneficiary.relationship = ClaimBeneficiary::Relation.shuffle.first
  end
  # GET /claim_beneficiaries/1/edit
  def edit
    @process_claim = ProcessClaim.find(@claim_beneficiary.process_claim_id)
  end

  # POST /claim_beneficiaries or /claim_beneficiaries.json
  def create
    # @claim_beneficiary = ClaimBeneficiary.new(claim_beneficiary_params)
    @process_claim = ProcessClaim.find(params[:v])
    @claim_beneficiary = @process_claim.claim_beneficiaries.build(claim_beneficiary_params)
    @claim_beneficiary.age = (@process_claim.date_filed - @claim_beneficiary.birthdate) /365
    respond_to do |format|
      if @claim_beneficiary.save
        # format.html { redirect_to claim_beneficiary_url(@claim_beneficiary), notice: "Claim beneficiary was successfully created." }
        format.html { redirect_back fallback_location: @process_claim, notice: "Claim beneficiary was successfully created." }
        format.json { render :show, status: :created, location: @claim_beneficiary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @claim_beneficiary.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claim_beneficiaries/1 or /claim_beneficiaries/1.json
  def update
    @process_claim = ProcessClaim.find(@claim_beneficiary.process_claim_id)
    respond_to do |format|
      if @claim_beneficiary.update(claim_beneficiary_params)
        format.html { redirect_back fallback_location: @process_claim, notice: "Claim beneficiary was successfully updated." }
        format.json { render :show, status: :ok, location: @claim_beneficiary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @claim_beneficiary.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /claim_beneficiaries/1 or /claim_beneficiaries/1.json
  def destroy
    @process_claim = ProcessClaim.find(@claim_beneficiary.process_claim_id)
    @claim_beneficiary.destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: @process_claim, notice: "Claim beneficiary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim_beneficiary
      @claim_beneficiary = ClaimBeneficiary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def claim_beneficiary_params
      params.require(:claim_beneficiary).permit(:process_claim_id, :name, :birthdate, :relationship, :age)
    end
end
