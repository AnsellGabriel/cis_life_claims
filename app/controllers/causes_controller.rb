class CausesController < ApplicationController
  before_action :set_cause, only: %i[ show edit update destroy ]

  # GET /causes or /causes.json
  def index
    @causes = Cause.all
  end

  # GET /causes/1 or /causes/1.json
  def show
  end

  # GET /causes/new
  def new
    @cause = Cause.new
  end

  # GET /causes/1/edit
  def edit
  end

  # POST /causes or /causes.json
  def create
    @cause = Cause.new(cause_params)

    respond_to do |format|
      if @cause.save
        format.html { redirect_to cause_url(@cause), notice: "Cause was successfully created." }
        format.json { render :show, status: :created, location: @cause }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /causes/1 or /causes/1.json
  def update
    respond_to do |format|
      if @cause.update(cause_params)
        format.html { redirect_to cause_url(@cause), notice: "Cause was successfully updated." }
        format.json { render :show, status: :ok, location: @cause }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /causes/1 or /causes/1.json
  def destroy
    @cause.destroy

    respond_to do |format|
      format.html { redirect_to causes_url, notice: "Cause was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cause
      @cause = Cause.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cause_params
      params.require(:cause).permit(:name, :description)
    end
end
