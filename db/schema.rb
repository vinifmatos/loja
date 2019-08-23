# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_21_184759) do

  create_table "categorias", force: :cascade do |t|
    t.string "nome"
    t.boolean "ativo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "imagem_produtos", force: :cascade do |t|
    t.integer "produto_id"
    t.string "imagem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_imagem_produtos_on_produto_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.decimal "preco", precision: 15, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "categoria_id"
    t.index ["categoria_id"], name: "index_produtos_on_categoria_id"
  end

  create_table "promocoes", force: :cascade do |t|
    t.integer "produto_id"
    t.decimal "desconto", precision: 15, scale: 2
    t.datetime "validade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_promocoes_on_produto_id"
  end

end
