class ProcessClaimsController < ApplicationController
  before_action :set_process_claim, only: %i[ show edit update destroy process claim_track evaluate claim_route change_status reconsider ]

  # GET /process_claims or /process_claims.json
  def index
    @process_claims = ProcessClaim.all
    
  end
  
  # GET /process_claims/1 or /process_claims/1.json
  def show
    if @process_claim.claim_cause.present? 
      @claim_cause = @process_claim.claim_cause
    else
      @claim_cause = @process_claim.build_claim_cause
    end
  end

  # GET /process_claims/new
  def new
    @process_claim = ProcessClaim.new
    @claim_cause = @process_claim.build_claim_cause
    set_dummy_claims
  end
  def set_dummy_claims
    @process_claim.processing = 0
    @process_claim.approval = 0
    @process_claim.payment = 0
    
    @coop = Cooperative.all
    @geo_region = GeoRegion.all
    @plan = Plan.all 
    @agent = Agent.all
    @cause = Cause.all
    @process_claim.insure_type = "Principal"
    @process_claim.gender=["Male", "Female"].shuffle.first
    
    @process_claim.plan_id = @plan.shuffle.first.id
    @process_claim.agent_id = @agent.shuffle.first.id
    @process_claim.cooperative_id = @coop.shuffle.first.id
    @process_claim.cause_id = @cause.shuffle.first.id
    @coop_branch = CoopBranch.where(cooperative_id: @process_claim.cooperative_id)
    
    @process_claim.geo_region_id = @geo_region.shuffle.first.id
    @geo_province = GeoProvince.where(geo_region_id: @process_claim.geo_region_id)
    @process_claim.geo_province_id = @geo_province.shuffle.first.id
    @geo_municipality = GeoMunicipality.where(geo_province_id: @process_claim.geo_province_id)
    @process_claim.geo_municipality_id = @geo_municipality.shuffle.first.id
    @geo_barangay = GeoBarangay.where(geo_municipality_id: @process_claim.geo_municipality_id)
    @process_claim.geo_barangay_id = @geo_barangay.shuffle.first.id

    @process_claim.lastname = FFaker::Name.last_name
    @process_claim.firstname = FFaker::Name.first_name
    @process_claim.middlename = FFaker::Name.name[0]
    # street = [1, 2, 3, 4, 5].shuffle.first
    @process_claim.street = rand(1..200).to_s + ' '+ FFaker::Name.last_name + ' Street'
  
    @process_claim.age = rand(18..65)
    @process_claim.occupation = ['None', 'Office clerk', 'Driver', 'Carpenter', 'Fisherman'].shuffle.first
    # @process_claim.occupation = FFaker::Job
  end
  # GET /process_claims/1/edit
  def edit
    if @process_claim.claim_cause.present? 
      @claim_cause = @process_claim.claim_cause
    else
      @claim_cause = @process_claim.build_claim_cause
    end
  end

  def claim_track 
    @claim_track = @process_claim.claim_tracks.build
    @claim_track.status_id = 1
    @claim_track.description = "Claim filed by " + FFaker::Name.name
  end

  def process_claim
    if @process_claim.processing 
      @proess = 0
    else
      @process = 1
    end
    respond_to do |format|
      if @process_claim.update_attribute(:processing, @process)
        @claim_track = @process_claim.claim_tracks.build
        @claim_track.status_id = 1
        @claim_track.description = "Process by " + FFaker::Name.name
        if @claim_track.save
          format.html { redirect_back fallback_location: process_claim_url(@process_claim), notice: "Updated" }
        end
      end
    end
  end
  
  def evaluate 
    @authority = AuthorityLevel.find(current_user.authority_level_id) 
    @claim_amount = @process_claim.get_benefit_claim_total(@process_claim)
  end

  def reconsider 

  end

  def claim_route 
    @claim_route = ClaimRoute.find(params[:p])
    case @claim_route.id
    when 2 then @process_claim.update_attribute(:processing, 0)
    when 3 then @process_claim.update_attribute(:processing, 1)
    when 4 then @process_claim.update_attribute(:approval, 1)
    end
    @claim_track = ClaimTrack.new
    @claim_track.process_claim = @process_claim
    @claim_track.user_id = current_user.id 
    @claim_track.claim_route = @claim_route
    respond_to do |format|

      if @claim_track.save  
          @process_claim.update_attribute(:claim_route, @claim_route)
          format.html { redirect_back fallback_location: evaluate_process_claim_url(@process_claim), notice: @claim_route.name }
          format.json { render :show, status: :ok, location: @process_claim }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @process_claim.errors, status: :unprocessable_entity }
        end
    
    end
  end

  def index_evaluate 
    @process_claims = ProcessClaim.where(approval: 1, payment: 0, claim_route_id: params[:c])
  end
  
  def index_reconsider
    @process_claims = ProcessClaim.where(status: "Denied", claim_route_id: 10)
  end

  def change_status 
    @claim_track = ClaimTrack.new
    @claim_track.process_claim = @process_claim
    @claim_track.user_id = current_user.id 
    @claim_track.description = params[:s]
    @claim_route = ClaimRoute.find(case params[:s]
    when "Approved" then 7
    when "Denied" then 9
    end)
    @claim_track.claim_route = @claim_route
    respond_to do |format|

      if @claim_track.save
          # @process_claim.claim_route = @claim_route
          # @process_claim.status = params[:s] 
          # @process_claim.approval = 1
          @process_claim.update(claim_route_id: @claim_route.id, status: params[:s], approval: 1, payment: 1) if @claim_route.id == 7
          @process_claim.update(claim_route_id: @claim_route.id, status: params[:s], approval: 1) if @claim_route.id == 9
            format.html { redirect_back fallback_location: evaluate_process_claim_url(@process_claim), notice: @claim_route.name }
            format.json { render :show, status: :ok, location: @process_claim }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @process_claim.errors, status: :unprocessable_entity }
        end
    
    end
  end
  # POST /process_claims or /process_claims.json
  def create
    @process_claim = ProcessClaim.new(process_claim_params)
    @process_claim.entry_type = "Onsite"
    @process_claim.claim_route_id = 2
    @process_claim.claim_filed = 1
    respond_to do |format|
      if @process_claim.save
        @claim_track = ClaimTrack.new
        @claim_track.process_claim = @process_claim
        @claim_track.user_id = current_user.id 
        @claim_track.claim_route_id = 2
                
        if @claim_track.save
          format.html { redirect_to process_claim_url(@process_claim), notice: "Process claim was successfully created." }
          format.json { render :show, status: :created, location: @process_claim }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @process_claim.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # PATCH/PUT /process_claims/1 or /process_claims/1.json
  def update
    respond_to do |format|
      if @process_claim.update(process_claim_params)
        format.html { redirect_to process_claim_url(@process_claim), notice: "Process claim was successfully updated." }
        format.json { render :show, status: :ok, location: @process_claim }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @process_claim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /process_claims/1 or /process_claims/1.json
  def destroy
    @process_claim.destroy

    respond_to do |format|
      format.html { redirect_to process_claims_url, notice: "Process claim was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_process_claim
      @process_claim = ProcessClaim.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def process_claim_params
      params.require(:process_claim).permit(:cooperative_id, :coop_branch_id, :claim_route_id, :plan_id, :agent_id, :geo_region_id, :geo_province_id, :geo_municipality_id, :geo_barangay_id, :cause_id, :unit, :insure_type, :street, :date_filed, :status, :lastname, :firstname, :middlename, :suffix, :birthdate, :gender, :age, :occupation, :date_incident, :entry_type, :claim_status_id, :claim_filed, :processing, :approval, :payment, :release,
      claim_benefits_param: [:id, :benefit_id, :amount, :status],
      claim_coverages_param: [:id, :orno, :or_date, :bsno, :bs_date, :effectivity, :expiry, :amount, :amount_cover, :coverage_type, :status],
      claim_beneficiaries_param: [:id, :name, :birthdate, :relationship, :age],
      claim_distributions_param: [:id, :name, :amount_type, :amount],
      claim_confinements_params: [:id, :date_admin, :date_discharge, :amount],
      claim_cause_attributes: [:id, :acd, :ucd, :osccd, :icd],
      claim_remarks_param: [:id, :user, :status, :remark],
      claim_tracks_param: [:id, :status_id, :description],
      claim_documents_param: [:id, :document_id, :file])
    end
end
