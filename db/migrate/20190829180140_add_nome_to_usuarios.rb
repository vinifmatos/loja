class AddNomeToUsuarios < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :nome, :string
  end
end
