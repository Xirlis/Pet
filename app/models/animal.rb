class Animal < ApplicationRecord
    has_many :atendimentos
    has_many :animals, through: :atendimentos

    scope :sorted, -> { order(:name)}

end
