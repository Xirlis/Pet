class AtendimentosController < ApplicationController
  before_action :set_atendimento, only: %i[ show edit update destroy ]

  def download
    @atendimentos= Atendimento.all
    pdf= Prawn::Document.new
    pdf.text "Clínica de animais", :size => 20, :style => :bold
    pdf.move_down 25
    a= 1

    @atendimentos.each do |atendimento|
      pdf.text "atendimento-#{a.to_s}", :size => 20, :style => :bold, :align => :center
      pdf.move_down 5
      pdf.text "Nome do Veterinario: #{atendimento.veterinario.nome}"
      pdf.move_down 5
      pdf.text "Nome do animal: #{atendimento.animal.nome}"
      a=a+1
    end
      send_data(pdf.render,
      filename: "Atendimentos.pdf",
      type:"application/pdf")
end

  def index
    current_page = (params[ :page] || 1).to_i
    @atendimentos = Atendimento.page(current_page).per(2)
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
        format.html { redirect_to atendimentos_url(@atendimento), notice: "Novo atendimento criado." }
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
        format.html { redirect_to atendimento_url(@atendimento), notice: " updated realizado." }
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
      format.html { redirect_to atendimentos_url, notice: "destruição concluida." }
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
