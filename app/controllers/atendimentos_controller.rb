class AtendimentosController < ApplicationController
  before_action :set_atendimento, only: %i[ show edit update destroy ]


  def index
    @atendimentos = Atendimento.all
  end

  def show
  end


  def new
    @atendimento = Atendimento.new
  end


  def edit
  end


  def create
    @atendimento = Atendimento.new(atendimento_params)

    respond_to do |format|
      if @atendimento.save
        format.html { redirect_to atendimento_url(@atendimento), notice: "Atendimento was successfully created." }
        format.json { render :show, status: :created, location: @atendimento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @atendimento.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @atendimento.update(atendimento_params)
        format.html { redirect_to atendimento_url(@atendimento), notice: "Atendimento was successfully updated." }
        format.json { render :show, status: :ok, location: @atendimento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @atendimento.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @atendimento.destroy

    respond_to do |format|
      format.html { redirect_to atendimentos_url, notice: "Atendimento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_atendimento
      @atendimento = Atendimento.find(params[:id])
    end


    def atendimento_params
      params.require(:atendimento).permit(:atendimentos_data, :veterinario_id, :animal_id)
    end
end
