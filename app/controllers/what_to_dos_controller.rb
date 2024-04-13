class WhatToDosController < ApplicationController
  before_action :set_what_to_do, only: %i[ show edit update destroy ]

  # GET /what_to_dos or /what_to_dos.json
  def index
    @what_to_dos = WhatToDo.all
  end

  # GET /what_to_dos/1 or /what_to_dos/1.json
  def show
  end

  # GET /what_to_dos/new
  def new
    @what_to_do = WhatToDo.new
  end

  # GET /what_to_dos/1/edit
  def edit
  end

  # POST /what_to_dos or /what_to_dos.json
  def create
    @what_to_do = WhatToDo.new(what_to_do_params)

    respond_to do |format|
      if @what_to_do.save
        format.html { redirect_to what_to_do_url(@what_to_do), notice: "What to do was successfully created." }
        format.json { render :show, status: :created, location: @what_to_do }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @what_to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /what_to_dos/1 or /what_to_dos/1.json
  def update
    respond_to do |format|
      if @what_to_do.update(what_to_do_params)
        format.html { redirect_to what_to_do_url(@what_to_do), notice: "What to do was successfully updated." }
        format.json { render :show, status: :ok, location: @what_to_do }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @what_to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /what_to_dos/1 or /what_to_dos/1.json
  def destroy
    @what_to_do.destroy!

    respond_to do |format|
      format.html { redirect_to what_to_dos_url, notice: "What to do was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_what_to_do
      @what_to_do = WhatToDo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def what_to_do_params
      params.require(:what_to_do).permit(:name, :time)
    end
end
