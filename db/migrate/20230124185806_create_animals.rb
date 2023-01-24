class CreateAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :animals do |t|
      t.string :nome
      t.integer :idade
      t.string :sexo

      t.timestamps
    end
  end
end
