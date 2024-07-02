class CourtdatesController < ApplicationController

  include CourtdatesHelper

  before_action :set_courtdate, only: %i[ show edit update destroy ]

  # GET /courtdates or /courtdates.json
  def index
    @courtdates = Courtdate.all
  end

  # GET /courtdates/1 or /courtdates/1.json
  def show
  end

  # GET /courtdates/new
  def new
    @l_id = params[:format]
    @lsuit = Lawsuit.find(@l_id)
    @courtdate = Courtdate.new
    # Lawsuit.order(:ct), :id, :ct
  end

  def zedit
    @l_id = params[:format]
    puts " = = = = = = >"
    @lsuit = Lawsuit.find(@l_id)
    @courtdate = @lsuit.courtdate
  end


  # GET /courtdates/1/edit
  def edit
   
  end

  # POST /courtdates or /courtdates.json
  def create
    @courtdate = Courtdate.new(courtdate_params)

    respond_to do |format|
      if @courtdate.save
        format.html { redirect_to user_lawsuits_path, notice: "Courtdate was successfully created." }
        format.json { render :show, status: :created, location: @courtdate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @courtdate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courtdates/1 or /courtdates/1.json
  def update
    respond_to do |format|
      if @courtdate.update(courtdate_params)
        format.html { redirect_to user_lawsuits_path }
        #format.html { redirect_to courtdate_url(@courtdate), notice: "Courtdate was successfully updated." }
        format.json { render :show, status: :ok, location: @courtdate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @courtdate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courtdates/1 or /courtdates/1.json
  def destroy
    @courtdate.destroy!

    respond_to do |format|
      format.html { redirect_to courtdates_url, notice: "Courtdate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_courtdate
      @courtdate = Courtdate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def courtdate_params
      params.require(:courtdate).permit(:complaint, :old_complaint, :paga, :old_paga, :answer, :old_answer, :cmc, :old_cmc, :first_expert_exchange, :second_expert_exchange, :discovery_cutoff, :old_discovery_cutoff, :trc, :old_trc, :trial, :old_trial, :lawsuit_id)
    end
end
