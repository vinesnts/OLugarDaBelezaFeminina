module SessionsHelper
  def sign_in(cliente)
    session[:cliente_id] = cliente.id
  end

  def current_cliente
    @current_cliente ||= Cliente.find_by(id: session[:cliente_id])
  end

  def block_access
    if current_cliente.present?
      redirect_to sessions_new_path
    end
  end

  def logged_in?
    !current_cliente.nil?
  end

  def sign_out
    session.delete(:cliente_id)
    @current_cliente = nil
  end

end
