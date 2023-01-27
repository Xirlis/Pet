class Veterinario < ApplicationRecord
    has_many :atendimentos, :dependent => :destroy
    has_many :animals, through: :atendimentos

    scope :sorted, -> { order(:nome)}

    validates :nome, presence: true, length: {minimum: 5}
    validates :idade, presence: true, length: {maximum: 2}
    validates :telefone, presence: true, length: {minimum: 9, maximum: 9}
    validates :email, :email_format => { :message => "use o formato identificador@dominio" }
end
