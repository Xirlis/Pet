class Veterinario < ApplicationRecord
    has_many :atendimentos
    has_many :animals, through: :atendimentos
end
