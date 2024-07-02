class DiscoveriesController < ApplicationController
  #before_action :set_discovery, only: %i[ show edit update destroy ]

  def goto_disc_folder
      Dir.chdir(Rails.root.join("FOLDER", "DISC"))
  end
  def set_lawsuit
      @lawsuit = Lawsuit.find(params[:format])
  end
  def download(foo)
    send_file "#{@lawsuit.atty_for}-#{foo}.docx", :disposition => 'attachment'
  end
  def populate_generic  
      @doc.bookmarks['atty_for'].insert_text_after(@lawsuit.atty_for)
      @doc.bookmarks['cn'].insert_text_after(@lawsuit.cn)
      @doc.bookmarks['judge'].insert_text_after(@lawsuit.judge)
      @doc.bookmarks['dept'].insert_text_after(@lawsuit.dept)
      @doc.bookmarks['date_filed'].insert_text_after(@lawsuit.courtdate.complaint.strftime("%m/%d/%Y"))
      
      @doc.bookmarks['plt_caption'].insert_text_after(@lawsuit.plt_caption)
      @doc.bookmarks['def_caption'].insert_text_after(@lawsuit.def_caption)   
  end
  def populate
      @doc.bookmarks['atty_for'].insert_text_after(@lawsuit.atty_for)
      @doc.bookmarks['cn'].insert_text_after(@lawsuit.cn)
      @doc.bookmarks['judge'].insert_text_after(@lawsuit.judge)
      @doc.bookmarks['dept'].insert_text_after(@lawsuit.dept)
      @doc.bookmarks['date_filed'].insert_text_after(@lawsuit.courtdate.complaint.strftime("%m/%d/%Y"))
      @doc.bookmarks['trial'].insert_text_after(@lawsuit.courtdate.trial)

      @doc.bookmarks['plt_caption'].insert_text_after(@lawsuit.plt_caption)
      @doc.bookmarks['def_caption'].insert_text_after(@lawsuit.def_caption)

  end
  def populate_t
      @doc.bookmarks['req_or_resp'].insert_text_after(@discovery.req_or_resp)
      @doc.bookmarks['set'].insert_text_after(@discovery.set)
  end

  def download_t
      send_file "Zack.docx", :disposition => 'attachment'
  end

  def initial_disclosures
      foo = __method__
      goto_disc_folder
      set_lawsuit
      puts " = = = = = "
      @doc = Docx::Document.open('initial_disclosures.docx')
      populate_generic
      @doc.save("#{@lawsuit.atty_for}-#{foo}.docx")
      download(foo)
      redirect_to lawsuit_path(@lawsuit)
  end

  def rfp
      puts " = = = = = = RFP = = = = = = "
      foo = __method__
      puts "clicked rfp"
      goto_disc_folder
      puts "moved to disc folder"
      set_lawsuit
      puts "set lawsuit"
      @doc = Docx::Document.open('rfp.docx')
      populate
      @doc.save("#{@lawsuit.atty_for}-#{foo}.docx")
      download(foo) 
      redirect_to lawsuit_path(@lawsuit)
  end


  # GET /discoveries or /discoveries.json
  def index
    @discoveries = Discovery.all
  end

  # GET /discoveries/1 or /discoveries/1.json
  def show
      @discovery = Discovery.find(params[:id])
  end

  # GET /discoveries/new
  def new
    @lawsuit = Lawsuit.find(params[:format])
    @discovery = Discovery.new
  end

  # GET /discoveries/1/edit
  def edit
    @discovery = Discovery.find(params[:id])
  end

  # POST /discoveries or /discoveries.json
  def create
    @discovery = Discovery.new(discovery_params)    
######
    goto_disc_folder
    @lawsuit = Lawsuit.find(@discovery.lawsuit_id)

    if @discovery.req_or_resp == 'request'
        @doc = Docx::Document.open('rfp.docx')
        populate_t
        @doc.save("Zack.docx")
        download_t
    else
      puts ""
      puts "Nothing here."
      puts "BALHL #{@discovery.req_or_resp}"
      puts ""
    end
######
    # respond_to do |format|
    #   if @discovery.save
    #     format.html { redirect_to discovery_url(@discovery), notice: "Discovery was successfully created." }
    #     format.json { render :show, status: :created, location: @discovery }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @discovery.errors, status: :unprocessable_entity }
    #   end
    # end
  end


  # PATCH/PUT /discoveries/1 or /discoveries/1.json
  def update
    respond_to do |format|
      if @discovery.update(discovery_params)
        format.html { redirect_to discovery_url(@discovery), notice: "Discovery was successfully updated." }
        format.json { render :show, status: :ok, location: @discovery }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @discovery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discoveries/1 or /discoveries/1.json
 def destroy
    @discovery = Discovery.find(params[:id])
    @discovery.destroy!

    respond_to do |format|
      format.html { redirect_to lawsuit_path(@discovery.lawsuit_id) }
    end
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discovery
      @discovery = Discovery.find(params[:id])
    end

    # # Only allow a list of trusted parameters through.
    def discovery_params
      params.require(:discovery).permit(:group, :date_served, :propounding_party, :responding_party, :req_or_resp, :discovery, :set, :service, :resp_due, :atty_notes, :lawsuit_id)
    end
end


