class CreateEnderecoClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :endereco_clientes do |t|
      t.string :cep
      t.string :logradouro
      t.string :numero
      t.string :bairro
      t.string :cidade
      t.string :complemento
      t.references :pedidos, :cliente, foreign_key: true

      t.timestamps
    end
  end
end
