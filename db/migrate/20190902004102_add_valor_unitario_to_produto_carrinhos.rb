class AddValorUnitarioToProdutoCarrinhos < ActiveRecord::Migration[5.2]
  def change
    add_column :produto_carrinhos, :valor_unitario, :decimal, precision: 15, scale: 2, null: false, default: 0
  end
end
