class ElementUpgradesController < ApplicationController
  before_action :set_element_upgrade, only: [:show, :edit, :update, :destroy]

  # GET /element_upgrades
  # GET /element_upgrades.json
  def index
    @element_upgrades = ElementUpgrade.all
  end

  # GET /element_upgrades/1
  # GET /element_upgrades/1.json
  def show
  end

  # GET /element_upgrades/new
  def new
    index()
    render 'index'
    #@element_upgrade = ElementUpgrade.new
  end

  # GET /element_upgrades/1/edit
  def edit
  end

  # POST /element_upgrades
  # POST /element_upgrades.json
  def create
    @element_upgrade = ElementUpgrade.new(element_upgrade_params)

    respond_to do |format|
      if @element_upgrade.save
        format.html { redirect_to @element_upgrade, notice: 'Element upgrade was successfully created.' }
        format.json { render :show, status: :created, location: @element_upgrade }
      else
        format.html { render :new }
        format.json { render json: @element_upgrade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /element_upgrades/1
  # PATCH/PUT /element_upgrades/1.json
  def update
    respond_to do |format|
      if @element_upgrade.update(element_upgrade_params)
        format.html { redirect_to @element_upgrade, notice: 'Element upgrade was successfully updated.' }
        format.json { render :show, status: :ok, location: @element_upgrade }
      else
        format.html { render :edit }
        format.json { render json: @element_upgrade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /element_upgrades/1
  # DELETE /element_upgrades/1.json
  def destroy
    @element_upgrade.destroy
    respond_to do |format|
      format.html { redirect_to element_upgrades_url, notice: 'Element upgrade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_element_upgrade
      @element_upgrade = ElementUpgrade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def element_upgrade_params
      params.require(:element_upgrade).permit(:combohash, :name)
    end
end
