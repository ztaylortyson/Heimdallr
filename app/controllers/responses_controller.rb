class ResponsesController < ApplicationController
  before_action :set_response, only: %i[ show edit update destroy ]

  def goto_resp_folder
      Dir.chdir(Rails.root.join("FOLDER", "RESP"))
  end
  def set_lawsuit
      @lawsuit = Lawsuit.find(params[:format])
  end
  def download(foo)
    send_file "#{foo}.docx", :disposition => 'attachment'
  end

  def populate
  end

  def g_response
    foo = __method__
    goto_resp_folder
    @lawsuit
    @doc = Docx::Document.open("response.docx")
    populate
    @doc.save("#{foo}.docx")
    download(foo)
  end

  # GET /responses or /responses.json
  def index
    @responses = Response.all
  end

  # GET /responses/1 or /responses/1.json
  def show
  end

  # GET /responses/new
  def new
    @lawsuit = Lawsuit.find(params[:format])
    @response = Response.new
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses or /responses.json
  def create
    @response = Response.new(response_params)

    respond_to do |format|
      if @response.save
        format.html { redirect_to response_url(@response), notice: "Response was successfully created." }
        format.json { render :show, status: :created, location: @response }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responses/1 or /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to response_url(@response), notice: "Response was successfully updated." }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1 or /responses/1.json
  def destroy
    @response.destroy!

    respond_to do |format|
      format.html { redirect_to responses_url, notice: "Response was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def response_params
      params.require(:response).permit(:group, :responding_party, :propounding_party, :discovery_type, :discovery_set, :lawsuit_id)
    end
end