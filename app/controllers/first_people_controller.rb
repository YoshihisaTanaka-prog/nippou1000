class FirstPeopleController < ApplicationController
  before_action :set_first_person, only: %i[ show edit update destroy ]

  # GET /first_people or /first_people.json
  def index
    @first_people = FirstPerson.all
  end

  # GET /first_people/1 or /first_people/1.json
  def show
  end

  # GET /first_people/new
  def new
    @first_person = FirstPerson.new
  end

  # GET /first_people/1/edit
  def edit
  end

  # POST /first_people or /first_people.json
  def create
    @first_person = FirstPerson.new(first_person_params)

    respond_to do |format|
      if @first_person.save
        format.html { redirect_to first_people_url, notice: "First person was successfully created." }
        format.json { render :show, status: :created, location: @first_person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @first_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /first_people/1 or /first_people/1.json
  def update
    respond_to do |format|
      if @first_person.update(first_person_params)
        format.html { redirect_to first_person_url(@first_person), notice: "First person was successfully updated." }
        format.json { render :show, status: :ok, location: @first_person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @first_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /first_people/1 or /first_people/1.json
  def destroy
    @first_person.destroy!

    respond_to do |format|
      format.html { redirect_to first_people_url, notice: "First person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_first_person
      @first_person = FirstPerson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def first_person_params
      params.require(:first_person).permit(:name, :is_base)
    end
end
