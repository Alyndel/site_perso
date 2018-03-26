class TypesDureeController < ApplicationController
  before_action :set_type_duree, only: [:show, :edit, :update, :destroy]

  # GET /types_duree
  # GET /types_duree.json
  def index
    @types_duree = TypeDuree.all
  end

  # GET /types_duree/1
  # GET /types_duree/1.json
  def show
  end

  # GET /types_duree/new
  def new
    @type_duree = TypeDuree.new
  end

  # GET /types_duree/1/edit
  def edit
  end

  # POST /types_duree
  # POST /types_duree.json
  def create
    @type_duree = TypeDuree.new(type_duree_params)

    respond_to do |format|
      if @type_duree.save
        format.html { redirect_to @type_duree, notice: 'Type duree was successfully created.' }
        format.json { render :show, status: :created, location: @type_duree }
      else
        format.html { render :new }
        format.json { render json: @type_duree.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /types_duree/1
  # PATCH/PUT /types_duree/1.json
  def update
    respond_to do |format|
      if @type_duree.update(type_duree_params)
        format.html { redirect_to @type_duree, notice: 'Type duree was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_duree }
      else
        format.html { render :edit }
        format.json { render json: @type_duree.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /types_duree/1
  # DELETE /types_duree/1.json
  def destroy
    @type_duree.destroy
    respond_to do |format|
      format.html { redirect_to types_duree_url, notice: 'Type duree was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_duree
      @type_duree = TypeDuree.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_duree_params
      params.require(:type_duree).permit(:libelle)
    end
end
