class Servico < ApplicationRecord
  belongs_to :reserva

  validates :nome, presence: true, length: {minimum: 6}
  validates :preco, presence: true, numericality: {only_float: true}, numericality: {greater_than: 0}
end
