class CreateConfiguracoes < ActiveRecord::Migration[5.2]
  def change
    create_table :configuracoes do |t|
      t.json :json

      t.timestamps
    end
  end
end
