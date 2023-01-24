class CreateAtendimentos < ActiveRecord::Migration[7.0]
  def change
    create_table :atendimentos do |t|
      t.datetime :atendimentos_data
      t.references :veterinario, null: false, foreign_key: true
      t.references :animal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
