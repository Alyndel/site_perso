class PolesController < ApplicationController
  before_action :set_pole, only: [:show, :edit, :update, :destroy]

  # GET /poles
  # GET /poles.json
  def index
    @poles = Pole.order(:code).all
  end

  # GET /poles/1
  # GET /poles/1.json
  def show
  end

  # GET /poles/new
  def new
    @pole = Pole.new
  end

  # GET /poles/1/edit
  def edit
  end

  # POST /poles
  # POST /poles.json
  def create
    @pole = Pole.new(pole_params)

    respond_to do |format|
      if @pole.save
        format.html { redirect_to @pole, notice: 'Pole was successfully created.' }
        format.json { render :show, status: :created, location: @pole }
      else
        format.html { render :new }
        format.json { render json: @pole.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poles/1
  # PATCH/PUT /poles/1.json
  def update
    respond_to do |format|
      if @pole.update(pole_params)
        format.html { redirect_to @pole, notice: 'Pole was successfully updated.' }
        format.json { render :show, status: :ok, location: @pole }
      else
        format.html { render :edit }
        format.json { render json: @pole.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poles/1
  # DELETE /poles/1.json
  def destroy
    @pole.destroy
    respond_to do |format|
      format.html { redirect_to poles_url, notice: 'Pole was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pole
      @pole = Pole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pole_params
      params.require(:pole).permit(:code, :libelle)
    end
end
