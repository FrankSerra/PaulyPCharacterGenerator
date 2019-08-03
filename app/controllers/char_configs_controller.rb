class CharConfigsController < ApplicationController
  before_action :set_char_config, only: [:show, :edit, :update, :destroy]

  # GET /char_configs
  # GET /char_configs.json
  def index
    @char_configs = CharConfig.all
  end

  # GET /char_configs/1
  # GET /char_configs/1.json
  def show
  end

  # GET /char_configs/new
  def new
    @char_config = CharConfig.new
  end

  # GET /char_configs/1/edit
  def edit
  end

  # POST /char_configs
  # POST /char_configs.json
  def create
    @char_config = CharConfig.new(char_config_params)

    respond_to do |format|
      if @char_config.save
        format.html { redirect_to @char_config, notice: 'Char config was successfully created.' }
        format.json { render :show, status: :created, location: @char_config }
      else
        format.html { render :new }
        format.json { render json: @char_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /char_configs/1
  # PATCH/PUT /char_configs/1.json
  def update
    respond_to do |format|
      if @char_config.update(char_config_params)
        format.html { redirect_to @char_config, notice: 'Char config was successfully updated.' }
        format.json { render :index, status: :ok, location: @char_config }
      else
        format.html { render :edit }
        format.json { render json: @char_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /char_configs/1
  # DELETE /char_configs/1.json
  def destroy
    @char_config.destroy
    respond_to do |format|
      format.html { redirect_to char_configs_url, notice: 'Char config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_char_config
      @char_config = CharConfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def char_config_params
      params.require(:char_config).permit(:statlinemax, :elementdoublepct)
    end
end
