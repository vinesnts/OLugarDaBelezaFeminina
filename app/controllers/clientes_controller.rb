class ClientesController < ApplicationController
  before_action :authorize, except: [:new, :create]
  before_action :correct_cliente?, only: [:edit, :update, :destroy]
  wrap_parameters :cliente, include: [:name, :password, :password_confirmation]

  # GET /clientes
  # GET /clientes.json
  def index
    @clientes = Cliente.all
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
    @cliente = Cliente.find(params[:id])
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
    @cliente = Cliente.find(params[:id])
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)
    if @cliente.save
      redirect_to @cliente, notice: "Cadastro feito com sucesso!"
      sign_in(@cliente)
    else
      render action: :new
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    @cliente = Cliente.find(params[:id])
    if @cliente.update_attributes(cliente_params)
      redirect_to cliente_path
    else
      render action: :edit
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @cliente = Cliente.find(params[:id])
    @cliente.destroy
    sign_out
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:nome, :telefone, :password, :password_confirmation, :etc1, :etc2 )
    end
end
