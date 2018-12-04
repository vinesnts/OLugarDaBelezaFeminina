class CreateProdutos < ActiveRecord::Migration[5.1]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :marca
      t.float :preco
      t.integer :quantidade
      t.text :descricao

      t.timestamps
    end
  end
end
