class PointsController < ApplicationController
  before_action :set_point, only: %i[ show edit update destroy ]

  # GET /points or /points.json
  def index
    @points = Point.all
  end

  # GET /points/1 or /points/1.json
  def show
  end

  # GET /points/new
  def new
    @point = Point.new
  end

  # GET /points/1/edit
  def edit
  end

  # POST /points or /points.json
  def create
    @point = Point.new(point_params)

    respond_to do |format|
      if @point.save
        format.html { redirect_to point_url(@point), notice: "Point was successfully created." }
        format.json { render :show, status: :created, location: @point }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /points/1 or /points/1.json
  def update
    respond_to do |format|
      if @point.update(point_params)
        format.html { redirect_to point_url(@point), notice: "Point was successfully updated." }
        format.json { render :show, status: :ok, location: @point }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /points/1 or /points/1.json
  def destroy
    @point.destroy!

    respond_to do |format|
      format.html { redirect_to points_url, notice: "Point was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point
      @point = Point.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def point_params
      params.require(:point).permit(:text, :is_good)
    end
end
