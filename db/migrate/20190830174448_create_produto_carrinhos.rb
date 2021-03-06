class CreateProdutoCarrinhos < ActiveRecord::Migration[5.2]
  def change
    create_table :produto_carrinhos do |t|
      t.references :carrinho, foreign_key: true
      t.references :produto, foreign_key: true
      t.integer :quantidade, null: false, default: 1

      t.timestamps
    end
  end
end
