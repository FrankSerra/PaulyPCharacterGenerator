class WeaponOffenseTypeCombosController < ApplicationController
  before_action :set_weapon_offense_type_combo, only: [:show, :edit, :update, :destroy]

  # GET /weapon_offense_type_combos
  # GET /weapon_offense_type_combos.json
  def index
    @weapon_offense_type_combos = WeaponOffenseTypeCombo.all
  end

  # GET /weapon_offense_type_combos/1
  # GET /weapon_offense_type_combos/1.json
  def show
  end

  # GET /weapon_offense_type_combos/new
  def new
    @weapon_offense_type_combo = WeaponOffenseTypeCombo.new
  end

  # GET /weapon_offense_type_combos/1/edit
  def edit
  end

  # POST /weapon_offense_type_combos
  # POST /weapon_offense_type_combos.json
  def create
    @weapon_offense_type_combo = WeaponOffenseTypeCombo.new(weapon_offense_type_combo_params)

    respond_to do |format|
      if @weapon_offense_type_combo.save
        format.html { redirect_to @weapon_offense_type_combo, notice: 'Weapon offense type combo was successfully created.' }
        format.json { render :show, status: :created, location: @weapon_offense_type_combo }
      else
        format.html { render :new }
        format.json { render json: @weapon_offense_type_combo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weapon_offense_type_combos/1
  # PATCH/PUT /weapon_offense_type_combos/1.json
  def update
    respond_to do |format|
      if @weapon_offense_type_combo.update(weapon_offense_type_combo_params)
        format.html { redirect_to @weapon_offense_type_combo, notice: 'Weapon offense type combo was successfully updated.' }
        format.json { render :show, status: :ok, location: @weapon_offense_type_combo }
      else
        format.html { render :edit }
        format.json { render json: @weapon_offense_type_combo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weapon_offense_type_combos/1
  # DELETE /weapon_offense_type_combos/1.json
  def destroy
    @weapon_offense_type_combo.destroy
    respond_to do |format|
      format.html { redirect_to weapon_offense_type_combos_url, notice: 'Weapon offense type combo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weapon_offense_type_combo
      @weapon_offense_type_combo = WeaponOffenseTypeCombo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weapon_offense_type_combo_params
      params.require(:weapon_offense_type_combo).permit(:alwayspick, :weapon_id, :offense_type_id)
    end
end
