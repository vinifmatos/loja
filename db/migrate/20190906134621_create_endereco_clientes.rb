class CreateEnderecoClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :endereco_clientes do |t|
      t.string :cep, null: false, default: ''
      t.string :logradouro, null: false, default: ''
      t.string :numero, null: false, default: ''
      t.string :bairro, null: false, default: ''
      t.string :cidade, null: false, default: ''
      t.string :complemento, null: false, default: ''
      t.references :cliente, foreign_key: true

      t.timestamps
    end
  end
end
