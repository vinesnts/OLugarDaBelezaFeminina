class CreateServicos < ActiveRecord::Migration[5.1]
  def change
    create_table :servicos do |t|
      t.string :nome
      t.float :preco
      t.text :descricao

      t.timestamps
    end
  end
end
