class Reserva < ApplicationRecord
    has_many :servicos
    belongs_to :cliente

    validates :servico_id, presence: true
    validates :dataHora, presence: true
    validates :precoTotal, presence: true
    validates :cliente_id, presence: true
end
