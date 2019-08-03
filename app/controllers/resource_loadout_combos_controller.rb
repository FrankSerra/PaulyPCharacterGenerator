class ResourceLoadoutCombosController < ApplicationController
  before_action :set_resource_loadout_combo, only: [:show, :edit, :update, :destroy]

  # GET /resource_loadout_combos
  # GET /resource_loadout_combos.json
  def index
    @resource_loadout_combos = ResourceLoadoutCombo.all
  end

  # GET /resource_loadout_combos/1
  # GET /resource_loadout_combos/1.json
  def show
  end

  # GET /resource_loadout_combos/new
  def new
    @resource_loadout_combo = ResourceLoadoutCombo.new
  end

  # GET /resource_loadout_combos/1/edit
  def edit
  end

  # POST /resource_loadout_combos
  # POST /resource_loadout_combos.json
  def create
    @resource_loadout_combo = ResourceLoadoutCombo.new(resource_loadout_combo_params)

    respond_to do |format|
      if @resource_loadout_combo.save
        format.html { redirect_to @resource_loadout_combo, notice: 'Resource loadout combo was successfully created.' }
        format.json { render :show, status: :created, location: @resource_loadout_combo }
      else
        format.html { render :new }
        format.json { render json: @resource_loadout_combo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resource_loadout_combos/1
  # PATCH/PUT /resource_loadout_combos/1.json
  def update
    respond_to do |format|
      if @resource_loadout_combo.update(resource_loadout_combo_params)
        format.html { redirect_to @resource_loadout_combo, notice: 'Resource loadout combo was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource_loadout_combo }
      else
        format.html { render :edit }
        format.json { render json: @resource_loadout_combo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource_loadout_combos/1
  # DELETE /resource_loadout_combos/1.json
  def destroy
    @resource_loadout_combo.destroy
    respond_to do |format|
      format.html { redirect_to resource_loadout_combos_url, notice: 'Resource loadout combo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource_loadout_combo
      @resource_loadout_combo = ResourceLoadoutCombo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_loadout_combo_params
      params.require(:resource_loadout_combo).permit(:resource_id, :offense_type_id)
    end
end
