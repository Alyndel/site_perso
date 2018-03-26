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

ActiveRecord::Schema.define(version: 20180223134944) do

  create_table "actualites", force: :cascade do |t|
    t.string "titre"
    t.text "contenu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batiments", force: :cascade do |t|
    t.string "nom"
    t.string "localisation"
    t.string "rue"
    t.string "code_postal"
    t.string "ville"
    t.string "plan"
    t.string "image"
    t.integer "etablissement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "plan_file_name"
    t.string "plan_content_type"
    t.integer "plan_file_size"
    t.datetime "plan_updated_at"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "centres_de_responsabilite", force: :cascade do |t|
    t.string "code"
    t.string "libelle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "libelle_court"
    t.integer "etablissement_ght_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "documents", force: :cascade do |t|
    t.string "libelle"
    t.string "document"
    t.float "ordre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "document_file_name"
    t.string "document_content_type"
    t.integer "document_file_size"
    t.datetime "document_updated_at"
    t.integer "formation_id"
  end

  create_table "etablissements", force: :cascade do |t|
    t.string "code"
    t.string "libelle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "etablissement_ght_id"
    t.string "libelle_court"
    t.string "adresse"
  end

  create_table "etablissements_ght", force: :cascade do |t|
    t.string "libelle"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "etablissements_ght_formations", id: false, force: :cascade do |t|
    t.integer "etablissement_ght_id"
    t.integer "formation_id"
  end

  create_table "formations", force: :cascade do |t|
    t.string "libelle"
    t.text "description"
    t.string "code"
    t.boolean "inscription_ouverte"
    t.integer "nb_inscription_min"
    t.integer "nb_inscription_max"
    t.float "duree"
    t.text "programme_detaille"
    t.text "objectifs_pedagogiques"
    t.text "conditions_specifiques"
    t.integer "theme_id"
    t.integer "type_formation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "type_duree_id"
  end

  create_table "groupes", force: :cascade do |t|
    t.string "code"
    t.string "libelle"
    t.string "type_groupe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groupes_de_sessions", force: :cascade do |t|
    t.string "libelle"
    t.integer "formation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groupes_utilisateurs", id: false, force: :cascade do |t|
    t.integer "groupe_id"
    t.integer "utilisateur_id"
  end

  create_table "matricules", force: :cascade do |t|
    t.string "libelle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "utilisateur_id"
  end

  create_table "poles", force: :cascade do |t|
    t.string "code"
    t.string "libelle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "libelle_court"
    t.integer "etablissement_ght_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.string "code"
    t.text "valeur"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "created_by"
    t.string "updated_by"
    t.index ["user_id"], name: "index_preferences_on_user_id"
  end

  create_table "salles", force: :cascade do |t|
    t.string "nom"
    t.string "description"
    t.integer "capacite"
    t.string "niveau"
    t.string "plan"
    t.string "image"
    t.integer "batiment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "plan_file_name"
    t.string "plan_content_type"
    t.integer "plan_file_size"
    t.datetime "plan_updated_at"
  end

  create_table "seances", force: :cascade do |t|
    t.string "libelle"
    t.float "duree"
    t.integer "formation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions_formation", force: :cascade do |t|
    t.string "description"
    t.date "date_debut"
    t.time "heure_debut"
    t.date "date_fin"
    t.time "heure_fin"
    t.string "statut"
    t.boolean "presence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "formation_id"
    t.integer "salle_id"
    t.integer "groupe_de_sessions_id"
  end

  create_table "sessions_formation_utilisateurs", id: false, force: :cascade do |t|
    t.integer "session_formation_id"
    t.integer "utilisateur_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "libelle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.text "contenu"
  end

  create_table "types_duree", force: :cascade do |t|
    t.string "libelle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types_formation", force: :cascade do |t|
    t.string "libelle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unites_fonctionnelles", force: :cascade do |t|
    t.string "code"
    t.string "libelle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "etablissement_id"
    t.integer "centre_de_responsabilite_id"
    t.integer "pole_id"
    t.integer "etablissement_ght_id"
    t.string "libelle_court"
  end

  create_table "unites_fonctionnelles_utilisateurs", force: :cascade do |t|
    t.integer "utilisateur_id"
    t.integer "unite_fonctionnelle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "id_res"
    t.string "login"
    t.string "nom_usage"
    t.string "prenom_usage"
    t.string "courriel"
    t.text "profils"
    t.date "date_premiere_connexion"
    t.date "date_derniere_connexion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "created_by"
    t.string "updated_by"
  end

  create_table "utilisateurs", force: :cascade do |t|
    t.string "idres"
    t.string "nom_usage"
    t.string "prenom_usage"
    t.date "date_naissance"
    t.date "date_entree"
    t.date "date_sortie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nom_phonetique"
    t.string "prenom_phonetique"
  end

end
