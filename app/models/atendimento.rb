class Atendimento < ApplicationRecord
  belongs_to :veterinario
  belongs_to :animal
end
