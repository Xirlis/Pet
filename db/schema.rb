# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_25_003139) do
  create_table "animals", force: :cascade do |t|
    t.string "nome"
    t.integer "idade"
    t.string "sexo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "atendimentos", force: :cascade do |t|
    t.datetime "atendimentos_data"
    t.integer "veterinario_id", null: false
    t.integer "animal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_atendimentos_on_animal_id"
    t.index ["veterinario_id"], name: "index_atendimentos_on_veterinario_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "veterinarios", force: :cascade do |t|
    t.string "nome"
    t.integer "idade"
    t.integer "telefone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "atendimentos", "animals"
  add_foreign_key "atendimentos", "veterinarios"
end
