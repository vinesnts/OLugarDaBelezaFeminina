json.extract! servico, :id, :nome, :preco, :descricao, :created_at, :updated_at
json.url servico_url(servico, format: :json)
