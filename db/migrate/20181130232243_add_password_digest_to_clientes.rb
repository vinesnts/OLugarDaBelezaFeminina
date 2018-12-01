class AddPasswordDigestToClientes < ActiveRecord::Migration[5.1]
  def change
    add_column :clientes, :password_digest, :string
  end
end
