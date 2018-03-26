class SessionsFormationController < ApplicationController
  before_action :set_session_formation, only: [:show, :edit, :update, :destroy, :ajouter_sessions_formation]

  # GET /sessions_formation
  # GET /sessions_formation.json
  def index
    @sessions_formation = SessionFormation.all
  end

  # GET /sessions_formation/1
  # GET /sessions_formation/1.json
  def show
  end

  # GET /sessions_formation/new
  def new
    @session_formation = SessionFormation.new
  end

  # GET /sessions_formation/1/edit
  def edit
  end

  # POST /sessions_formation
  # POST /sessions_formation.json
  def create
    @session_formation = SessionFormation.new(session_formation_params)

    respond_to do |format|
      if @session_formation.save
        format.html { redirect_to @session_formation, notice: 'Session formation was successfully created.' }
        format.json { render :show, status: :created, location: @session_formation }
      else
        format.html { render :new }
        format.json { render json: @session_formation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessions_formation/1
  # PATCH/PUT /sessions_formation/1.json
  def update
    respond_to do |format|
      if @session_formation.update(session_formation_params)
        format.html { redirect_to @session_formation, notice: 'Session formation was successfully updated.' }
        format.json { render :show, status: :ok, location: @session_formation }
      else
        format.html { render :edit }
        format.json { render json: @session_formation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions_formation/1
  # DELETE /sessions_formation/1.json
  def destroy
    @session_formation.destroy
    respond_to do |format|
      format.html { redirect_to sessions_formation_url, notice: 'Session formation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def ajouter_sessions_formation
    @formation = Formation.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session_formation
      @session_formation = SessionFormation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_formation_params
      params.require(:session_formation).permit(:description, :date_debut, :heure_debut, :date_fin, :heure_fin, :statut, :presence, :formation_id, :salle_id)
    end
end
