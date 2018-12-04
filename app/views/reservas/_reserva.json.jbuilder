json.extract! reserva, :id, :servico_id, :dataHora, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
