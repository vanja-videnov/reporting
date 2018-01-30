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

ActiveRecord::Schema.define(version: 20180123115944) do

  create_table "faktori", force: :cascade do |t|
    t.integer "ljudstvo_id"
    t.integer "oprema_id"
    t.integer "primena_lekova_id"
    t.integer "incident_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_id"], name: "index_faktori_on_incident_id"
    t.index ["ljudstvo_id"], name: "index_faktori_on_ljudstvo_id"
    t.index ["oprema_id"], name: "index_faktori_on_oprema_id"
    t.index ["primena_lekova_id"], name: "index_faktori_on_primena_lekova_id"
  end

  create_table "incidenti", force: :cascade do |t|
    t.integer "tip_ucesnika_id"
    t.date "datum"
    t.integer "starost_bolesnika_id"
    t.integer "pol_id"
    t.integer "asa_klasifikacija_id"
    t.integer "tip_ustanove_id"
    t.integer "mesto_id"
    t.integer "tip_incidenta_id"
    t.string "opis"
    t.string "misljenje"
    t.boolean "moguce_preventirati"
    t.integer "preduzeto_id"
    t.integer "ishod_id"
    t.integer "uticaj_na_razresenje_id"
    t.string "vaznost_razresenja"
    t.integer "ocekivanje_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asa_klasifikacija_id"], name: "index_incidenti_on_asa_klasifikacija_id"
    t.index ["ishod_id"], name: "index_incidenti_on_ishod_id"
    t.index ["mesto_id"], name: "index_incidenti_on_mesto_id"
    t.index ["ocekivanje_id"], name: "index_incidenti_on_ocekivanje_id"
    t.index ["pol_id"], name: "index_incidenti_on_pol_id"
    t.index ["preduzeto_id"], name: "index_incidenti_on_preduzeto_id"
    t.index ["starost_bolesnika_id"], name: "index_incidenti_on_starost_bolesnika_id"
    t.index ["tip_incidenta_id"], name: "index_incidenti_on_tip_incidenta_id"
    t.index ["tip_ucesnika_id"], name: "index_incidenti_on_tip_ucesnika_id"
    t.index ["tip_ustanove_id"], name: "index_incidenti_on_tip_ustanove_id"
    t.index ["uticaj_na_razresenje_id"], name: "index_incidenti_on_uticaj_na_razresenje_id"
  end

  create_table "sifarnici", force: :cascade do |t|
    t.integer "tip_id", null: false
    t.boolean "aktivno", default: true, null: false
    t.string "identifikator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tip_id"], name: "index_sifarnici_on_tip_id"
  end

  create_table "sifarnik_tipovi", force: :cascade do |t|
    t.string "identifikator", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sifarnik_veze", force: :cascade do |t|
    t.integer "incident_id"
    t.integer "sifarnik_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_id"], name: "index_sifarnik_veze_on_incident_id"
    t.index ["sifarnik_id"], name: "index_sifarnik_veze_on_sifarnik_id"
  end

end
