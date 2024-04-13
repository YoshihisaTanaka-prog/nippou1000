class LearnedListsController < ApplicationController
  before_action :set_learned_list, only: %i[ show edit update destroy ]

  # GET /learned_lists or /learned_lists.json
  def index
    @learned_lists = LearnedList.all
  end

  # GET /learned_lists/1 or /learned_lists/1.json
  def show
  end

  # GET /learned_lists/new
  def new
    @learned_list = LearnedList.new
  end

  # GET /learned_lists/1/edit
  def edit
  end

  # POST /learned_lists or /learned_lists.json
  def create
    @learned_list = LearnedList.new(learned_list_params)

    respond_to do |format|
      if @learned_list.save
        format.html { redirect_to learned_list_url(@learned_list), notice: "Learned list was successfully created." }
        format.json { render :show, status: :created, location: @learned_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @learned_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learned_lists/1 or /learned_lists/1.json
  def update
    respond_to do |format|
      if @learned_list.update(learned_list_params)
        format.html { redirect_to learned_list_url(@learned_list), notice: "Learned list was successfully updated." }
        format.json { render :show, status: :ok, location: @learned_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @learned_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learned_lists/1 or /learned_lists/1.json
  def destroy
    @learned_list.destroy!

    respond_to do |format|
      format.html { redirect_to learned_lists_url, notice: "Learned list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learned_list
      @learned_list = LearnedList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def learned_list_params
      params.require(:learned_list).permit(:text, :is_learned)
    end
end
