class CentresDeResponsabiliteController < ApplicationController
  before_action :set_centre_de_responsabilite, only: [:show, :edit, :update, :destroy]

  # GET /centres_de_responsabilite
  # GET /centres_de_responsabilite.json
  def index
    @centres_de_responsabilite = CentreDeResponsabilite.order(:code).all
  end

  # GET /centres_de_responsabilite/1
  # GET /centres_de_responsabilite/1.json
  def show
  end

  # GET /centres_de_responsabilite/new
  def new
    @centre_de_responsabilite = CentreDeResponsabilite.new
  end

  # GET /centres_de_responsabilite/1/edit
  def edit
  end

  # POST /centres_de_responsabilite
  # POST /centres_de_responsabilite.json
  def create
    @centre_de_responsabilite = CentreDeResponsabilite.new(centre_de_responsabilite_params)

    respond_to do |format|
      if @centre_de_responsabilite.save
        format.html { redirect_to @centre_de_responsabilite, notice: 'Centre de responsabilite was successfully created.' }
        format.json { render :show, status: :created, location: @centre_de_responsabilite }
      else
        format.html { render :new }
        format.json { render json: @centre_de_responsabilite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /centres_de_responsabilite/1
  # PATCH/PUT /centres_de_responsabilite/1.json
  def update
    respond_to do |format|
      if @centre_de_responsabilite.update(centre_de_responsabilite_params)
        format.html { redirect_to @centre_de_responsabilite, notice: 'Centre de responsabilite was successfully updated.' }
        format.json { render :show, status: :ok, location: @centre_de_responsabilite }
      else
        format.html { render :edit }
        format.json { render json: @centre_de_responsabilite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /centres_de_responsabilite/1
  # DELETE /centres_de_responsabilite/1.json
  def destroy
    @centre_de_responsabilite.destroy
    respond_to do |format|
      format.html { redirect_to centres_de_responsabilite_url, notice: 'Centre de responsabilite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_centre_de_responsabilite
      @centre_de_responsabilite = CentreDeResponsabilite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def centre_de_responsabilite_params
      params.require(:centre_de_responsabilite).permit(:code, :libelle)
    end
end
