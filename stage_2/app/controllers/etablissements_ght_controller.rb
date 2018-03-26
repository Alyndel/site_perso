class EtablissementsGhtController < ApplicationController
  before_action :set_etablissement_ght, only: [:show, :edit, :update, :destroy]

  # GET /etablissements_ght
  # GET /etablissements_ght.json
  def index
    @etablissements_ght = EtablissementGht.order(:code).all
  end

  # GET /etablissements_ght/1
  # GET /etablissements_ght/1.json
  def show
  end

  # GET /etablissements_ght/new
  def new
    @etablissement_ght = EtablissementGht.new
  end

  # GET /etablissements_ght/1/edit
  def edit
  end

  # POST /etablissements_ght
  # POST /etablissements_ght.json
  def create
    @etablissement_ght = EtablissementGht.new(etablissement_ght_params)

    respond_to do |format|
      if @etablissement_ght.save
        format.html { redirect_to @etablissement_ght, notice: 'Etablissement ght was successfully created.' }
        format.json { render :show, status: :created, location: @etablissement_ght }
      else
        format.html { render :new }
        format.json { render json: @etablissement_ght.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /etablissements_ght/1
  # PATCH/PUT /etablissements_ght/1.json
  def update
    respond_to do |format|
      if @etablissement_ght.update(etablissement_ght_params)
        format.html { redirect_to @etablissement_ght, notice: 'Etablissement ght was successfully updated.' }
        format.json { render :show, status: :ok, location: @etablissement_ght }
      else
        format.html { render :edit }
        format.json { render json: @etablissement_ght.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /etablissements_ght/1
  # DELETE /etablissements_ght/1.json
  def destroy
    @etablissement_ght.destroy
    respond_to do |format|
      format.html { redirect_to etablissements_ght_url, notice: 'Etablissement ght was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_etablissement_ght
      @etablissement_ght = EtablissementGht.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def etablissement_ght_params
      params.require(:etablissement_ght).permit(:libelle, :code, formation_ids: [])
    end
end
