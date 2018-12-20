class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authorize
    unless logged_in?
      redirect_to root_url
    end
  end

  def correct_cliente?
    @cliente = Cliente.find(params[:id])
    unless current_cliente == @cliente
      redirect_to clientes_path
    end
  end

end
