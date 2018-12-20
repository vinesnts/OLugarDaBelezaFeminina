class SessionsController < ApplicationController
  include SessionsHelper
  # before_action :block_access, except: [:destroy]
  def create
    @cliente = Cliente.find_by(telefone: params[:session][:telefone])
    if @cliente && @cliente.authenticate(params[:session][:password])
      sign_in @cliente
      redirect_to @cliente
    else
      render "new"
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
