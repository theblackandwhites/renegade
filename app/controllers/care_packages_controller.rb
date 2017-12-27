class CarePackagesController < ApplicationController
  before_action :set_care_package, only: [:show, :edit, :update, :destroy]

  # GET /care_packages
  # GET /care_packages.json
  def index
    @care_packages = CarePackage.all
  end

  # GET /care_packages/1
  # GET /care_packages/1.json
  def show
  end

  # GET /care_packages/new
  def new
    @care_package = CarePackage.new
  end

  # GET /care_packages/1/edit
  def edit
  end

  # POST /care_packages
  # POST /care_packages.json
  def create
    @care_package = CarePackage.new(care_package_params)

    respond_to do |format|
      if @care_package.save
        format.html { redirect_to @care_package, notice: 'Care package was successfully created.' }
        format.json { render :show, status: :created, location: @care_package }
      else
        format.html { render :new }
        format.json { render json: @care_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /care_packages/1
  # PATCH/PUT /care_packages/1.json
  def update
    respond_to do |format|
      if @care_package.update(care_package_params)
        format.html { redirect_to @care_package, notice: 'Care package was successfully updated.' }
        format.json { render :show, status: :ok, location: @care_package }
      else
        format.html { render :edit }
        format.json { render json: @care_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /care_packages/1
  # DELETE /care_packages/1.json
  def destroy
    @care_package.destroy
    respond_to do |format|
      format.html { redirect_to care_packages_url, notice: 'Care package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_care_package
      @care_package = CarePackage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def care_package_params
      params.require(:care_package).permit(:title, :price)
    end
end
