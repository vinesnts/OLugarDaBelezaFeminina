class Cliente < ApplicationRecord

    has_secure_password
    has_many :reservas

    validates :nome, presence: true
    validates :telefone, presence: true, numericality: {only_integer: true}, uniqueness: true, length: {minimum: 11, maximum: 11}
    validates :password, presence: true, length: {minimum: 8}
end
