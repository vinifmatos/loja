class AddCategoriaToProduto < ActiveRecord::Migration[5.2]
  def change
    add_reference :produtos, :categoria, foreign_key: true
  end
end
