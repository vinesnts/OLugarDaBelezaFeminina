class Reserva < ApplicationRecord
    validates :servico_id, presence: true
    validates :dataHora, presence: true
end
