class Veterinario < ApplicationRecord
    has_many :atendimentos, :dependent => :destroy
    has_many :animals, through: :atendimentos

    scope :sorted, -> { order(:name)}

end
