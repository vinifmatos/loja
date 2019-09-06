class AddEnderecoClienteToPedidos < ActiveRecord::Migration[5.2]
  def change
    add_reference :pedidos, :endereco_cliente, foreign_key: true
  end
end
