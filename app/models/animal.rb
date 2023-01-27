class Animal < ApplicationRecord
    has_many :atendimentos, :dependent => :destroy
    has_many :veterinarios, through: :atendimentos

    scope :sorted, -> { order(:nome)}

    validates :nome, presence: true, length: {minimum: 3}
    validates :idade, presence: true
    validates :sexo, presence: true, length: {minimum: 1, maximum: 1} 

end
