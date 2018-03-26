class TypesFormationController < ApplicationController
  before_action :set_type_formation, only: [:show, :edit, :update, :destroy]

  # GET /types_formation
  # GET /types_formation.json
  def index
    @types_formation = TypeFormation.all
  end

  # GET /types_formation/1
  # GET /types_formation/1.json
  def show
  end

  # GET /types_formation/new
  def new
    @type_formation = TypeFormation.new
  end

  # GET /types_formation/1/edit
  def edit
  end

  # POST /types_formation
  # POST /types_formation.json
  def create
    @type_formation = TypeFormation.new(type_formation_params)

    respond_to do |format|
      if @type_formation.save
        format.html { redirect_to @type_formation, notice: 'Type formation was successfully created.' }
        format.json { render :show, status: :created, location: @type_formation }
      else
        format.html { render :new }
        format.json { render json: @type_formation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /types_formation/1
  # PATCH/PUT /types_formation/1.json
  def update
    respond_to do |format|
      if @type_formation.update(type_formation_params)
        format.html { redirect_to @type_formation, notice: 'Type formation was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_formation }
      else
        format.html { render :edit }
        format.json { render json: @type_formation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /types_formation/1
  # DELETE /types_formation/1.json
  def destroy
    @type_formation.destroy
    respond_to do |format|
      format.html { redirect_to types_formation_url, notice: 'Type formation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_formation
      @type_formation = TypeFormation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_formation_params
      params.require(:type_formation).permit(:libelle)
    end
end
