class AddPublicarAndEncerradaToPromocoes < ActiveRecord::Migration[5.2]
  def change
    add_column :promocoes, :publicacao, :datetime
    add_column :promocoes, :encerramento, :datetime
  end
end
