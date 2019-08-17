class CreatePromocoes < ActiveRecord::Migration[5.2]
  def change
    create_table :promocoes do |t|
      t.references :produto, foreign_key: true
      t.decimal :preco, precision: 15, scale: 2
      t.datetime :validade

      t.timestamps
    end
  end
end
