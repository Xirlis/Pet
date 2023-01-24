class CreateVeterinarios < ActiveRecord::Migration[7.0]
  def change
    create_table :veterinarios do |t|
      t.string :nome
      t.integer :idade
      t.integer :telefone
      t.string :email

      t.timestamps
    end
  end
end
