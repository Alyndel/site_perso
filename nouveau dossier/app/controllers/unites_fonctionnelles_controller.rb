class UnitesFonctionnellesController < ApplicationController
  before_action :set_unite_fonctionnelle, only: [:show, :edit, :update, :destroy]

  # GET /unites_fonctionnelles
  # GET /unites_fonctionnelles.json
  def index
    @unites_fonctionnelles = UniteFonctionnelle.order(:code).all
  end

  # GET /unites_fonctionnelles/1
  # GET /unites_fonctionnelles/1.json
  def show
  end

  # GET /unites_fonctionnelles/new
  def new
    @unite_fonctionnelle = UniteFonctionnelle.new
  end

  # GET /unites_fonctionnelles/1/edit
  def edit
  end

  # POST /unites_fonctionnelles
  # POST /unites_fonctionnelles.json
  def create
    @unite_fonctionnelle = UniteFonctionnelle.new(unite_fonctionnelle_params)

    respond_to do |format|
      if @unite_fonctionnelle.save
        format.html { redirect_to @unite_fonctionnelle, notice: 'Unite fonctionnelle was successfully created.' }
        format.json { render :show, status: :created, location: @unite_fonctionnelle }
      else
        format.html { render :new }
        format.json { render json: @unite_fonctionnelle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unites_fonctionnelles/1
  # PATCH/PUT /unites_fonctionnelles/1.json
  def update
    respond_to do |format|
      if @unite_fonctionnelle.update(unite_fonctionnelle_params)
        format.html { redirect_to @unite_fonctionnelle, notice: 'Unite fonctionnelle was successfully updated.' }
        format.json { render :show, status: :ok, location: @unite_fonctionnelle }
      else
        format.html { render :edit }
        format.json { render json: @unite_fonctionnelle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unites_fonctionnelles/1
  # DELETE /unites_fonctionnelles/1.json
  def destroy
    @unite_fonctionnelle.destroy
    respond_to do |format|
      format.html { redirect_to unites_fonctionnelles_url, notice: 'Unite fonctionnelle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unite_fonctionnelle
      @unite_fonctionnelle = UniteFonctionnelle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unite_fonctionnelle_params
      params.require(:unite_fonctionnelle).permit(:code, :libelle, :etablissement_id, :centre_de_responsabilite_id, :pole_id, :etablissement_ght)
    end
end
