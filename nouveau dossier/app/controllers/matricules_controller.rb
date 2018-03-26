class MatriculesController < ApplicationController
  before_action :set_matricule, only: [:show, :edit, :update, :destroy]

  # GET /matricules
  # GET /matricules.json
  def index
    # On récupère la liste des matricules avec une requête sur la base, de sorte à ce qu'il
    # n'y ait rien d'affiché au chargement. Cela permet un chargement très rapide de la page.
    @matricules = Matricule.requete_matricule(params[:requete]) + Matricule.requete_nom(params[:requete]) + Matricule.requete_prenom(params[:requete])
  end

  # GET /matricules/1
  # GET /matricules/1.json
  def show
  end

  # GET /matricules/new
  def new
    @matricule = Matricule.new
  end

  # GET /matricules/1/edit
  def edit
  end

  # POST /matricules
  # POST /matricules.json
  def create
    @matricule = Matricule.new(matricule_params)

    respond_to do |format|
      if @matricule.save
        format.html { redirect_to @matricule, notice: 'Matricule was successfully created.' }
        format.json { render :show, status: :created, location: @matricule }
      else
        format.html { render :new }
        format.json { render json: @matricule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matricules/1
  # PATCH/PUT /matricules/1.json
  def update
    respond_to do |format|
      if @matricule.update(matricule_params)
        format.html { redirect_to @matricule, notice: 'Matricule was successfully updated.' }
        format.json { render :show, status: :ok, location: @matricule }
      else
        format.html { render :edit }
        format.json { render json: @matricule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matricules/1
  # DELETE /matricules/1.json
  def destroy
    @matricule.destroy
    respond_to do |format|
      format.html { redirect_to matricules_url, notice: 'Matricule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matricule
      @matricule = Matricule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matricule_params
      params.require(:matricule).permit(:libelle)
    end
end
