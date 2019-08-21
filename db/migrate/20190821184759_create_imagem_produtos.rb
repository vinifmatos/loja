class CreateImagemProdutos < ActiveRecord::Migration[5.2]
  def change
    create_table :imagem_produtos do |t|
      t.references :produto, foreign_key: true
      t.string :imagem

      t.timestamps
    end
  end
end
