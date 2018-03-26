class GroupesDeSessionsController < ApplicationController
  before_action :set_groupe_de_sessions, only: [:show, :edit, :update, :destroy]

  # GET /groupes_de_sessions
  # GET /groupes_de_sessions.json
  def index
    @groupes_de_sessions = GroupeDeSessions.all
  end

  # GET /groupes_de_sessions/1
  # GET /groupes_de_sessions/1.json
  def show
  end

  # GET /groupes_de_sessions/new
  def new
    # debugger
    @groupe_de_sessions = GroupeDeSessions.new
    @groupe_de_sessions.formation_id = params[:id]
    
    nb_seances = Formation.find(params[:id]).seances.count
    nb_seances.times { @groupe_de_sessions.sessions_formation.build }
  end

  # GET /groupes_de_sessions/1/edit
  def edit
  end

  # POST /groupes_de_sessions
  # POST /groupes_de_sessions.json
  def create
    @groupe_de_sessions = GroupeDeSessions.new(groupe_de_sessions_params)

    respond_to do |format|
      if @groupe_de_sessions.save!
        format.html { redirect_to @groupe_de_sessions, notice: 'Groupe de sessions was successfully created.' }
        format.json { render :show, status: :created, location: @groupe_de_sessions }
      else
        format.html { render :new }
        format.json { render json: @groupe_de_sessions.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groupes_de_sessions/1
  # PATCH/PUT /groupes_de_sessions/1.json
  def update
    respond_to do |format|
      if @groupe_de_sessions.update(groupe_de_sessions_params)
        format.html { redirect_to @groupe_de_sessions, notice: 'Groupe de sessions was successfully updated.' }
        format.json { render :show, status: :ok, location: @groupe_de_sessions }
      else
        format.html { render :edit }
        format.json { render json: @groupe_de_sessions.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groupes_de_sessions/1
  # DELETE /groupes_de_sessions/1.json
  def destroy
    @groupe_de_sessions.destroy
    respond_to do |format|
      format.html { redirect_to groupes_de_sessions_url, notice: 'Groupe de sessions was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupe_de_sessions
      @groupe_de_sessions = GroupeDeSessions.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def groupe_de_sessions_params
      params.require(:groupe_de_sessions).permit(:libelle, :formation_id,
                                                 sessions_formation_attributes: [:id, :_destroy, :description, :date_debut, :heure_debut, :date_fin, :heure_fin, :statut, :formation_id, :salle_id, :groupe_de_sessions_id])
    end
end
