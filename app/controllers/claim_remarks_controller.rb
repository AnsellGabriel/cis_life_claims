class ClaimRemarksController < ApplicationController
  before_action :set_claim_remark, only: %i[ show edit update destroy ]

  # GET /claim_remarks or /claim_remarks.json
  def index
    @claim_remarks = ClaimRemark.all
  end

  # GET /claim_remarks/1 or /claim_remarks/1.json
  def show
  end

  # GET /claim_remarks/new
  def new
    # @claim_remark = ClaimRemark.new
    @process_claim = ProcessClaim.find(params[:v])
    @claim_remark = @process_claim.claim_remarks.build
    @change_status = params[:s]
    set_dummy_param
  end

  def set_dummy_param
    @claim_remark.user = current_user.user_name 
    @claim_remark.status = params[:s]
    @claim_remark.remark = FFaker::HealthcareIpsum.paragraph
    
  end

  # GET /claim_remarks/1/edit
  def edit
    
  end

  # POST /claim_remarks or /claim_remarks.json
  def create
    # @claim_remark = ClaimRemark.new(claim_remark_params)
    @process_claim = ProcessClaim.find(params[:v])
    @claim_remark = @process_claim.claim_remarks.build(claim_remark_params)
    @claim_remark.user = current_user.user_name
    @status = params[:s]
    respond_to do |format|
      if @claim_remark.save
        unless params[:s].blank?
          change_status(params[:s])
          # puts "@@@ ikaw"
        end
        format.html { redirect_back fallback_location: evaluate_process_claim_path(@process_claim), notice: "Claim remark was successfully created." }
        format.json { render :show, status: :created, location: @claim_remark }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @claim_remark.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end
  def change_status(status)
    @claim_track = ClaimTrack.new
    @claim_track.process_claim = @process_claim
    @claim_track.user_id = current_user.id 
    @claim_track.description = params[:s]
    @claim_route = ClaimRoute.find(case params[:s]
    when "Approved" then 7
    when "Denied" then 9
    when "Reconsider" then 10
    end)
    @claim_track.claim_route = @claim_route
    if @claim_track.save 
      @process_claim.update(claim_route_id: @claim_route.id, status: params[:s], approval: 1, payment: 1) if @claim_route.id == 7
      @process_claim.update(claim_route_id: @claim_route.id, status: params[:s], approval: 1) if @claim_route.id == 9
      @process_claim.update(claim_route_id: @claim_route.id) if @claim_route.id == 10
    end
  end
  
  # PATCH/PUT /claim_remarks/1 or /claim_remarks/1.json
  def update
    respond_to do |format|
      if @claim_remark.update(claim_remark_params)
        format.html { redirect_back fallback_location: @process_claim, notice: "Claim remark was successfully updated." }
        format.json { render :show, status: :ok, location: @claim_remark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @claim_remark.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /claim_remarks/1 or /claim_remarks/1.json
  def destroy
    @claim_remark.destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: @process_claim, notice: "Claim remark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim_remark
      @claim_remark = ClaimRemark.find(params[:id])
      @process_claim = ProcessClaim.find(@claim_remark.process_claim_id)
    end

    # Only allow a list of trusted parameters through.
    def claim_remark_params
      params.require(:claim_remark).permit(:process_claim_id, :user, :status, :remark)
    end
end
