class OcsController < ApplicationController
  before_action :set_oc, only: %i[ show edit update destroy ]

    def goto_corres_folder
      Dir.chdir(Rails.root.join("FOLDER", "CORRES"))
    end

    def download(foo)
      send_file "#{@lawsuit.atty_for}-#{foo}.docx", :disposition => 'attachment'
    end

    def attycorres
      foo = __method__
      goto_corres_folder
      @oc = Oc.find(params[:format]) 
      @lawsuit = Lawsuit.find(@oc.lawsuit_id)   
      @doc = Docx::Document.open('attycorres.docx')
      populate_attycorres
      @doc.save("#{@lawsuit.atty_for}-#{foo}.docx")
      download(foo)
    end

    def attyenvelope
      foo = __method__
      goto_corres_folder
      @oc = Oc.find(params[:format]) 
      @lawsuit = Lawsuit.find(@oc.lawsuit_id)   
      @doc = Docx::Document.open('attyenvelope.docx')

      populate_attyenvelope
      @doc.save("#{@lawsuit.atty_for}-#{foo}.docx")
      download(foo)
    end

    def envelope
      foo = __method__
      goto_corres_folder
      @oc = Oc.find(params[:format])    
      @lawsuit = Lawsuit.find(@oc.lawsuit_id)
      @doc = Docx::Document.open('envelope.docx')

      populate_envelope
      @doc.save("#{@lawsuit.atty_for}-#{foo}.docx")
      download(foo)
    end

    def populate_attycorres
      @doc.bookmarks['full_name'].insert_text_after(@oc.full_name)
      @doc.bookmarks['fname'].insert_text_after(@oc.fname)
      @doc.bookmarks['address'].insert_text_after(@oc.address)

      @doc.bookmarks['ct'].insert_text_after(@lawsuit.ct)
      @doc.bookmarks['cn'].insert_text_after(@lawsuit.cn)
    end

    def populate_attyenvelope
      @doc.bookmarks['full_name'].insert_text_after(@oc.full_name)
      @doc.bookmarks['fname'].insert_text_after(@oc.fname)
      @doc.bookmarks['address'].insert_text_after(@oc.address)
    end




  # GET /ocs or /ocs.json
  def index
    @ocs = Oc.all
  end

  # GET /ocs/1 or /ocs/1.json
  def show
  end

  # GET /ocs/new
  def new
    @oc = Oc.new
  end

  # GET /ocs/1/edit
  def edit
  end

  # POST /ocs or /ocs.json
  def create
    @oc = Oc.new(oc_params)

    respond_to do |format|
      if @oc.save
        format.html { redirect_to oc_url(@oc), notice: "Oc was successfully created." }
        format.json { render :show, status: :created, location: @oc }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @oc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ocs/1 or /ocs/1.json
  def update
    respond_to do |format|
      if @oc.update(oc_params)
        format.html { redirect_to oc_url(@oc), notice: "Oc was successfully updated." }
        format.json { render :show, status: :ok, location: @oc }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @oc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ocs/1 or /ocs/1.json
  def destroy
    @oc.destroy!

    respond_to do |format|
      format.html { redirect_to ocs_url, notice: "Oc was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oc
      @oc = Oc.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def oc_params
      params.require(:oc).permit(:full_name, :sbn, :fname, :address, :phone, :email, :website, :lawsuit_id)
    end
end
