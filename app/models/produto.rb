class Produto < ApplicationRecord
  validates :nome, presence: true, length: {minimum: 6}
  validates :marca, presence: true
  validates :preco, presence: true, numericality: {only_float: true}, numericality: {greater_than: 0}
  validates :quantidade, presence: true, numericality: {only_integer: true}, numericality: {greater_than: 0}
end
