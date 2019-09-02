class CreatePedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :pedidos do |t|
      t.integer :situacao
      t.references :carrinho, foreign_key: true
      t.datetime :data
      t.decimal :valor, precision: 15, scale: 2

      t.timestamps
    end
  end
end
