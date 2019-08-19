class AddImagensToProduto < ActiveRecord::Migration[5.2]
  def change
    add_column :produtos, :imagens, :json
  end
end
