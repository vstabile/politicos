# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120318183600) do

  create_table "memberships", :force => true do |t|
    t.integer  "politico_id"
    t.integer  "orgao_id"
    t.string   "cargo"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "memberships", ["orgao_id"], :name => "index_memberships_on_orgao_id"
  add_index "memberships", ["politico_id"], :name => "index_memberships_on_politico_id"

  create_table "orgaos", :force => true do |t|
    t.string   "sigla"
    t.text     "descricao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "nome"
  end

  create_table "partidos", :force => true do |t|
    t.string   "nome"
    t.string   "sigla"
    t.string   "numero_eleitora"
    t.string   "deferimento"
    t.string   "presidente"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "politicos", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "partido_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "id_parlamentar"
    t.string   "nome"
    t.string   "nome_parlamentar"
    t.string   "sexo"
    t.string   "uf"
    t.string   "gabinete"
    t.string   "anexo"
    t.string   "fone"
    t.string   "foto"
  end

  add_index "politicos", ["email"], :name => "index_politicos_on_email", :unique => true
  add_index "politicos", ["reset_password_token"], :name => "index_politicos_on_reset_password_token", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votos", :force => true do |t|
    t.integer  "votacao_id"
    t.string   "voto"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "votos", ["votacao_id"], :name => "index_votos_on_votacao_id"

end
