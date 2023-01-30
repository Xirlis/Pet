class Atendimento < ApplicationRecord
  belongs_to :veterinario, :optional => true
  belongs_to :animal, :optional => true
end
