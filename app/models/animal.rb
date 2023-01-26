class Animal < ApplicationRecord
    has_many :atendimentos, :dependent => :destroy
    has_many :veterinarios, through: :atendimentos

    scope :sorted, -> { order(:name)}

end
