class AuthorityLevelsController < ApplicationController
  before_action :set_authority_level, only: %i[ show edit update destroy ]

  # GET /authority_levels or /authority_levels.json
  def index
    @authority_levels = AuthorityLevel.all
  end

  # GET /authority_levels/1 or /authority_levels/1.json
  def show
  end

  # GET /authority_levels/new
  def new
    @authority_level = AuthorityLevel.new
  end

  # GET /authority_levels/1/edit
  def edit
  end

  # POST /authority_levels or /authority_levels.json
  def create
    @authority_level = AuthorityLevel.new(authority_level_params)

    respond_to do |format|
      if @authority_level.save
        format.html { redirect_to authority_level_url(@authority_level), notice: "Authority level was successfully created." }
        format.json { render :show, status: :created, location: @authority_level }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @authority_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authority_levels/1 or /authority_levels/1.json
  def update
    respond_to do |format|
      if @authority_level.update(authority_level_params)
        format.html { redirect_to authority_level_url(@authority_level), notice: "Authority level was successfully updated." }
        format.json { render :show, status: :ok, location: @authority_level }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @authority_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authority_levels/1 or /authority_levels/1.json
  def destroy
    @authority_level.destroy

    respond_to do |format|
      format.html { redirect_to authority_levels_url, notice: "Authority level was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authority_level
      @authority_level = AuthorityLevel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def authority_level_params
      params.require(:authority_level).permit(:name, :min_authority, :max_authority, :description)
    end
end
