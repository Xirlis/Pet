class AnimalsController < ApplicationController
  before_action :set_animal, only: %i[ show edit update destroy ]


  def index
    current_page = (params[ :page] || 1).to_i
    @animals = Animal.sorted.page(current_page).per(2)
  end


  def show
  end


  def new
    @animal = Animal.new
  end


  def edit
  end


  def create
    @animal = Animal.new(animal_params)

    respond_to do |format|
      if @animal.save
        format.html { redirect_to animals_url(@animal), notice: "Novo animal criado." }
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to animal_url(@animal), notice: " updated realizado." }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @animal.destroy

    respond_to do |format|
      format.html { redirect_to animals_url, notice: "Destruição concluida." }
      format.json { head :no_content }
    end
  end

  private

    def set_animal
      @animal = Animal.find(params[:id])
    end


    def animal_params
      params.require(:animal).permit(:nome, :idade, :sexo)
    end
end
