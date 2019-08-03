class OffenseTypesController < ApplicationController
  before_action :set_offense_type, only: [:show, :edit, :update, :destroy]

  # GET /offense_types
  # GET /offense_types.json
  def index
    @offense_types = OffenseType.all
  end

  # GET /offense_types/1
  # GET /offense_types/1.json
  def show
  end

  # GET /offense_types/new
  def new
    @offense_type = OffenseType.new
  end

  # GET /offense_types/1/edit
  def edit
  end

  # POST /offense_types
  # POST /offense_types.json
  def create
    @offense_type = OffenseType.new(offense_type_params)

    respond_to do |format|
      if @offense_type.save
        format.html { redirect_to @offense_type, notice: 'Offense type was successfully created.' }
        format.json { render :show, status: :created, location: @offense_type }
      else
        format.html { render :new }
        format.json { render json: @offense_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offense_types/1
  # PATCH/PUT /offense_types/1.json
  def update
    respond_to do |format|
      if @offense_type.update(offense_type_params)
        format.html { redirect_to @offense_type, notice: 'Offense type was successfully updated.' }
        format.json { render :show, status: :ok, location: @offense_type }
      else
        format.html { render :edit }
        format.json { render json: @offense_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offense_types/1
  # DELETE /offense_types/1.json
  def destroy
    @offense_type.destroy
    respond_to do |format|
      format.html { redirect_to offense_types_url, notice: 'Offense type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offense_type
      @offense_type = OffenseType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offense_type_params
      params.require(:offense_type).permit(:name, :numberofweapons)
    end
end
