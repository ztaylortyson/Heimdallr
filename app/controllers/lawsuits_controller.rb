class LawsuitsController < ApplicationController
  before_action :set_lawsuit, only: %i[ show edit update destroy ]

  # GET /lawsuits or /lawsuits.json
  def index
    @lawsuits = Lawsuit.all
  end

  # GET /lawsuits/1 or /lawsuits/1.json
  def show
      lawsuit = Lawsuit.find(params[:id])
      @ctdates = lawsuit.courtdate
      # if !lawsuit.courtdate.nil?
      #   if !lawsuit.courtdate.complaint.nil?  
      #     @complaint = lawsuit.courtdate.complaint.strftime('%m/%d/%Y')
      #   end
      #   if !lawsuit.courtdate.answer.nil?
      #     @answer = lawsuit.courtdate.answer.strftime('%m/%d/%Y')
      #   else
      #     @answer = "No responsive pleading on file."
      #   end
      #   if !lawsuit.courtdate.cmc.nil?
      #     @cmc = lawsuit.courtdate.cmc.strftime('%m/%d/%Y') 
      #   else 
      #     @cmc = "Not Set"
      #   end
      #   if !lawsuit.courtdate.trial.nil?
      #     @trial = lawsuit.courtdate.trial.strftime('%m/%d/%Y')
      #     @thirtyb4trial = lawsuit.courtdate.trial.strftime('%m/%d/%Y')
      #     @oneofive = (lawsuit.courtdate.trial - 105).strftime('%m/%d/%Y')
      #     @fortyfive = (lawsuit.courtdate.trial - 150).strftime('%m/%d/%Y')
      #   else
      #     @trial = "Not Set"
      #   end
      #   if !lawsuit.courtdate.trc.nil?
      #     @trc = lawsuit.courtdate.trc.strftime('%m/%d/%Y')
      #   else
      #     @trc = "Not Set"
      #   end
      #   if !lawsuit.courtdate.discovery_cutoff.nil?
      #     @discovery_cutoff =  lawsuit.courtdate.discovery_cutoff.strftime('%m/%d/%Y')
      #     @thirtyfive = (lawsuit.courtdate.discovery_cutoff - 35).strftime('%m/%d/%Y')
      #   else
      #     @discovery_cutoff = "Not Set"
      #   end

      #   puts "+ + + + +    + + + ++   +         + + + + + + "
      #   puts lawsuit.courtdate.inspect 
      #   puts @cmc.inspect
      #end

     # trc local rule 2.1.15 submit trc report, SDSC Rule, 5 court days before
     # cmc local rule 2.1.9  15 calendar days
      #@oneofive = (court_dates.trial - 105).inspect
     # mil local 2.1.18 5 court days, opp 2 court days

      
  end

  # GET /lawsuits/new
  def new
    @u = current_user.id
    puts " = = = = = "
    puts @u
    @lawsuit = Lawsuit.new

    #@lawsuit.courtdate.build

  end

  # GET /lawsuits/1/edit
  def edit
  end

  # POST /lawsuits or /lawsuits.json
  def create
    @lawsuit = Lawsuit.new(lawsuit_params)

    respond_to do |format|
      if @lawsuit.save
        format.html { redirect_to lawsuit_url(@lawsuit), notice: "Lawsuit was successfully created." }
        format.json { render :show, status: :created, location: @lawsuit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lawsuit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lawsuits/1 or /lawsuits/1.json
  def update
    respond_to do |format|
      if @lawsuit.update(lawsuit_params)
        format.html { redirect_to lawsuit_url(@lawsuit), notice: "Lawsuit was successfully updated." }
        format.json { render :show, status: :ok, location: @lawsuit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lawsuit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lawsuits/1 or /lawsuits/1.json
  def destroy
    @lawsuit.destroy!

    respond_to do |format|
      format.html { redirect_to lawsuits_url, notice: "Lawsuit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lawsuit
      @lawsuit = Lawsuit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lawsuit_params
      params.require(:lawsuit).permit(:ct_county, :ct_street_address, :ct_mail_address, :ct_city_zip, :ct_branch, :cn, :ct, :forum, :location, :stage, :status, :judge, :old_judge, :dept, :lroa, :lroa, :atty_for, :user_id, :plt_caption, :def_caption, courtdate_attributes: [:complaint, :answer, :cmc, :trial, :trc, :discovery_cutoff, :first_expert_exchange, :second_expert_exchange, :id, :_destroy])
    end
end
