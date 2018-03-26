class ActualitesController < ApplicationController
  before_action :set_actualite, only: [:show, :edit, :update, :destroy]

  # GET /actualites
  # GET /actualites.json
  def index
    @actualites = Actualite.all
  end

  # GET /actualites/1
  # GET /actualites/1.json
  def show
  end

  # GET /actualites/new
  def new
    @actualite = Actualite.new
  end

  # GET /actualites/1/edit
  def edit
  end

  # POST /actualites
  # POST /actualites.json
  def create
    @actualite = Actualite.new(actualite_params)

    respond_to do |format|
      if @actualite.save
        format.html { redirect_to @actualite, notice: 'Actualite was successfully created.' }
        format.json { render :show, status: :created, location: @actualite }
      else
        format.html { render :new }
        format.json { render json: @actualite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actualites/1
  # PATCH/PUT /actualites/1.json
  def update
    respond_to do |format|
      if @actualite.update(actualite_params)
        format.html { redirect_to @actualite, notice: 'Actualite was successfully updated.' }
        format.json { render :show, status: :ok, location: @actualite }
      else
        format.html { render :edit }
        format.json { render json: @actualite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actualites/1
  # DELETE /actualites/1.json
  def destroy
    @actualite.destroy
    respond_to do |format|
      format.html { redirect_to actualites_url, notice: 'Actualite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actualite
      @actualite = Actualite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actualite_params
      params.require(:actualite).permit(:titre, :contenu)
    end
end
