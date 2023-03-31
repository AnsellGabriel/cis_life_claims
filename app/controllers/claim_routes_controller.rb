class ClaimRoutesController < ApplicationController
  before_action :set_claim_route, only: %i[ show edit update destroy ]

  # GET /claim_routes or /claim_routes.json
  def index
    @claim_routes = ClaimRoute.all
  end

  # GET /claim_routes/1 or /claim_routes/1.json
  def show
  end

  # GET /claim_routes/new
  def new
    @claim_route = ClaimRoute.new
  end

  # GET /claim_routes/1/edit
  def edit
  end

  # POST /claim_routes or /claim_routes.json
  def create
    @claim_route = ClaimRoute.new(claim_route_params)

    respond_to do |format|
      if @claim_route.save
        format.html { redirect_to claim_route_url(@claim_route), notice: "Claim route was successfully created." }
        format.json { render :show, status: :created, location: @claim_route }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @claim_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claim_routes/1 or /claim_routes/1.json
  def update
    respond_to do |format|
      if @claim_route.update(claim_route_params)
        format.html { redirect_to claim_route_url(@claim_route), notice: "Claim route was successfully updated." }
        format.json { render :show, status: :ok, location: @claim_route }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @claim_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /claim_routes/1 or /claim_routes/1.json
  def destroy
    @claim_route.destroy

    respond_to do |format|
      format.html { redirect_to claim_routes_url, notice: "Claim route was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim_route
      @claim_route = ClaimRoute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def claim_route_params
      params.require(:claim_route).permit(:name, :description)
    end
end
