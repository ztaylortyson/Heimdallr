class DepositionsController < ApplicationController
  before_action :set_deposition, only: %i[ show edit update destroy ]


  def goto_depo_folder
      Dir.chdir(Rails.root.join("FOLDER", "DEPO"))
  end
  def set_lawsuit
      @lawsuit = Lawsuit.find(@deposition.lawsuit_id)
  end
  def download
    send_file "#{@lawsuit.atty_for}-#{@deposition.deponent}_depo.docx", :disposition => 'attachment'
  end
  def download_objs
    send_file "#{@deposition.deponent}_Objections_to_Depo.docx", :disposition => 'attachment'
  end
  def populate
      if @doc.bookmarks['title']
        @doc.bookmarks['title'].insert_text_after(@deposition.title)
      end
      @doc.bookmarks['atty_for'].insert_text_after(@lawsuit.atty_for)
      @doc.bookmarks['atty_for_top'].insert_text_after(@lawsuit.atty_for)
      
      @doc.bookmarks['atty_for_body'].insert_text_after(@lawsuit.atty_for)
      @doc.bookmarks['atty_for_end'].insert_text_after(@lawsuit.atty_for)

      @doc.bookmarks['cn'].insert_text_after(@lawsuit.cn)
  
      if @doc.bookmarks['judge']
        @doc.bookmarks['judge'].insert_text_after(@lawsuit.judge)
      end
      if @doc.bookmarks['dept']
        @doc.bookmarks['dept'].insert_text_after(@lawsuit.dept)
      end
      if @doc.bookmarks['date_file']
        @doc.bookmarks['date_filed'].insert_text_after(@lawsuit.courtdate.complaint.strftime("%m/%d/%Y"))
      end
      @doc.bookmarks['plt_caption'].insert_text_after(@lawsuit.plt_caption)
      @doc.bookmarks['def_caption'].insert_text_after(@lawsuit.def_caption)
      @doc.bookmarks['propounding_party'].insert_text_after(@deposition.propounding_party)
      @doc.bookmarks['deponent'].insert_text_after(@deposition.deponent)
  end

  def generate_depo
    @deposition = Deposition.find(params[:format]) 
    goto_depo_folder
    set_lawsuit
    puts " = = = = = "
    puts @deposition.id
    puts @deposition.deponent
    if File.exist?('depo_individual.docx')
      puts "file exists"
    else
      puts "not finding it"
    end
    puts Dir.glob('*.docx')
    @doc = Docx::Document.open('depo_individual.docx')
    populate 
    @doc.save("#{@lawsuit.atty_for}-#{@deposition.deponent}_depo.docx")
    download 
    #redirect_to lawsuit_path(@lawsuit)
  end
  def generate_depo_objections
    @deposition = Deposition.find(params[:format]) 
    goto_depo_folder
    set_lawsuit
    @doc = Docx::Document.open('objections_to_deposition.docx')
    populate
    @doc.save("#{@deposition.deponent}_Objections_to_Depo.docx")
    download_objs
  end





  # GET /depositions or /depositions.json
  def index
    @depositions = Deposition.all
  end

  # GET /depositions/1 or /depositions/1.json
  def show

  end

  # GET /depositions/new
  def new
    @lawsuit = Lawsuit.find(params[:format])
    @deposition = Deposition.new
  end

  # GET /depositions/1/edit
  def edit
  end

  # POST /depositions or /depositions.json
  def create
    @deposition = Deposition.new(deposition_params)

    respond_to do |format|
      if @deposition.save
        format.html { redirect_to deposition_url(@deposition), notice: "Deposition was successfully created." }
        format.json { render :show, status: :created, location: @deposition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /depositions/1 or /depositions/1.json
  def update
    respond_to do |format|
      if @deposition.update(deposition_params)
        format.html { redirect_to deposition_url(@deposition), notice: "Deposition was successfully updated." }
        format.json { render :show, status: :ok, location: @deposition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @deposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /depositions/1 or /depositions/1.json
  def destroy
    @deposition.destroy!

    respond_to do |format|
      format.html { redirect_to lawsuit_path(@deposition.lawsuit_id)}
      # format.html { redirect_to depositions_url, notice: "Deposition was successfully destroyed." }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deposition
      @deposition = Deposition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deposition_params
      params.require(:deposition).permit(:depo_date, :depo_time, :deponent, :doc_req, :propounding_party, :title, :lawsuit_id)
    end
end
