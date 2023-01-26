class VeterinariosController < ApplicationController
  before_action :set_veterinario, only: %i[ show edit update destroy ]


  def index
    current_page = (params[ :page] || 1).to_i
    @veterinarios = Veterinario.sorted.page(current_page).per(2)
  end


  def show
  end


  def new
    @veterinario = Veterinario.new
  end


  def edit
  end


  def create
    @veterinario = Veterinario.new(veterinario_params)

    respond_to do |format|
      if @veterinario.save
        format.html { redirect_to veterinario_url(@veterinario), notice: "Veterinario was successfully created." }
        format.json { render :show, status: :created, location: @veterinario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @veterinario.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @veterinario.update(veterinario_params)
        format.html { redirect_to veterinario_url(@veterinario), notice: "Veterinario was successfully updated." }
        format.json { render :show, status: :ok, location: @veterinario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @veterinario.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @veterinario.destroy

    respond_to do |format|
      format.html { redirect_to veterinarios_url, alert: "Veterinario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
 
    def set_veterinario
      @veterinario = Veterinario.find(params[:id])
    end


    def veterinario_params
      params.require(:veterinario).permit(:nome, :idade, :telefone, :email)
    end
end
