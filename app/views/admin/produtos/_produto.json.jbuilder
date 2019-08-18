json.extract! produto, :id, :nome, :descicao, :preco, :created_at, :updated_at
json.url produto_url([:admin, produto], format: :json)
