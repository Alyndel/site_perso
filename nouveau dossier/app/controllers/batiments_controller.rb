class BatimentsController < ApplicationController
  before_action :set_batiment, only: [:show, :edit, :update, :destroy]

  # GET /batiments
  # GET /batiments.json
  def index
    @batiments = Batiment.all
  end

  # GET /batiments/1
  # GET /batiments/1.json
  def show
  end

  # GET /batiments/new
  def new
    @batiment = Batiment.new
  end

  # GET /batiments/1/edit
  def edit
  end

  # POST /batiments
  # POST /batiments.json
  def create
    @batiment = Batiment.new(batiment_params)

    respond_to do |format|
      if @batiment.save
        format.html { redirect_to @batiment, notice: 'Batiment was successfully created.' }
        format.json { render :show, status: :created, location: @batiment }
      else
        format.html { render :new }
        format.json { render json: @batiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batiments/1
  # PATCH/PUT /batiments/1.json
  def update
    respond_to do |format|
      if @batiment.update(batiment_params)
        format.html { redirect_to @batiment, notice: 'Batiment was successfully updated.' }
        format.json { render :show, status: :ok, location: @batiment }
      else
        format.html { render :edit }
        format.json { render json: @batiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batiments/1
  # DELETE /batiments/1.json
  def destroy
    @batiment.destroy
    respond_to do |format|
      format.html { redirect_to batiments_url, notice: 'Batiment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batiment
      @batiment = Batiment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batiment_params
      params.require(:batiment).permit(:nom, :localisation, :rue, :code_postal, :ville, :plan, :image, :etablissement_id)
    end
end
