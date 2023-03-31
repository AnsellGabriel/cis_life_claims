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

ActiveRecord::Schema[7.0].define(version: 2023_03_30_003118) do
  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "agents", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authority_levels", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.decimal "min_authority", precision: 18, scale: 2
    t.decimal "max_authority", precision: 18, scale: 2
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "benefits", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "branches", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "causes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "claim_beneficiaries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "process_claim_id"
    t.string "name"
    t.date "birthdate"
    t.string "relationship"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["process_claim_id"], name: "index_claim_beneficiaries_on_process_claim_id"
  end

  create_table "claim_benefits", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "process_claim_id", null: false
    t.bigint "benefit_id", null: false
    t.decimal "amount", precision: 18, scale: 2
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_id"], name: "index_claim_benefits_on_benefit_id"
    t.index ["process_claim_id"], name: "index_claim_benefits_on_process_claim_id"
  end

  create_table "claim_causes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "acd"
    t.text "ucd"
    t.text "osccd"
    t.text "icd"
    t.bigint "process_claim_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["process_claim_id"], name: "index_claim_causes_on_process_claim_id"
  end

  create_table "claim_confinements", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "date_admit"
    t.date "date_discharge"
    t.decimal "amount", precision: 18, scale: 2
    t.bigint "process_claim_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["process_claim_id"], name: "index_claim_confinements_on_process_claim_id"
  end

  create_table "claim_coverages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "orno"
    t.date "or_date"
    t.string "bsno"
    t.date "bs_date"
    t.date "effectivity"
    t.date "expiry"
    t.decimal "amount", precision: 18, scale: 2
    t.decimal "amount_cover", precision: 18, scale: 2
    t.string "coverage_type"
    t.string "status"
    t.bigint "process_claim_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["process_claim_id"], name: "index_claim_coverages_on_process_claim_id"
  end

  create_table "claim_distributions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "process_claim_id"
    t.string "name"
    t.string "amount_type"
    t.decimal "amount", precision: 18, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["process_claim_id"], name: "index_claim_distributions_on_process_claim_id"
  end

  create_table "claim_documents", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "process_claim_id", null: false
    t.bigint "document_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_claim_documents_on_document_id"
    t.index ["process_claim_id"], name: "index_claim_documents_on_process_claim_id"
  end

  create_table "claim_remarks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "process_claim_id", null: false
    t.string "user"
    t.string "status"
    t.text "remark"
    t.datetime "date_post"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["process_claim_id"], name: "index_claim_remarks_on_process_claim_id"
  end

  create_table "claim_routes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "claim_tracks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "process_claim_id"
    t.bigint "user_id"
    t.bigint "claim_route_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["claim_route_id"], name: "index_claim_tracks_on_claim_route_id"
    t.index ["process_claim_id"], name: "index_claim_tracks_on_process_claim_id"
    t.index ["user_id"], name: "index_claim_tracks_on_user_id"
  end

  create_table "coop_branches", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "cooperative_id", null: false
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_id"], name: "index_coop_branches_on_cooperative_id"
  end

  create_table "cooperatives", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "geo_barangays", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "geo_region_id", null: false
    t.bigint "geo_province_id", null: false
    t.bigint "geo_municipality_id", null: false
    t.string "name"
    t.string "psgc_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geo_municipality_id"], name: "index_geo_barangays_on_geo_municipality_id"
    t.index ["geo_province_id"], name: "index_geo_barangays_on_geo_province_id"
    t.index ["geo_region_id"], name: "index_geo_barangays_on_geo_region_id"
  end

  create_table "geo_municipalities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "geo_region_id", null: false
    t.bigint "geo_province_id", null: false
    t.string "name"
    t.string "psgc_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geo_province_id"], name: "index_geo_municipalities_on_geo_province_id"
    t.index ["geo_region_id"], name: "index_geo_municipalities_on_geo_region_id"
  end

  create_table "geo_provinces", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "geo_region_id", null: false
    t.string "name"
    t.string "psgc_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geo_region_id"], name: "index_geo_provinces_on_geo_region_id"
  end

  create_table "geo_regions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "psgc_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "process_claims", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "cooperative_id"
    t.bigint "coop_branch_id"
    t.bigint "plan_id"
    t.bigint "agent_id"
    t.bigint "geo_region_id"
    t.bigint "geo_province_id"
    t.bigint "geo_municipality_id"
    t.bigint "geo_barangay_id"
    t.bigint "cause_id"
    t.bigint "claim_status_id"
    t.string "unit"
    t.string "insure_type"
    t.string "street"
    t.date "date_filed"
    t.string "status"
    t.string "lastname"
    t.string "firstname"
    t.string "middlename"
    t.string "suffix"
    t.date "birthdate"
    t.string "gender"
    t.integer "age"
    t.string "occupation"
    t.date "date_incident"
    t.string "entry_type"
    t.boolean "claim_filed"
    t.boolean "processing"
    t.boolean "approval"
    t.boolean "payment"
    t.boolean "release"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "claim_route_id"
    t.index ["agent_id"], name: "index_process_claims_on_agent_id"
    t.index ["cause_id"], name: "index_process_claims_on_cause_id"
    t.index ["claim_route_id"], name: "index_process_claims_on_claim_route_id"
    t.index ["claim_status_id"], name: "index_process_claims_on_claim_status_id"
    t.index ["coop_branch_id"], name: "index_process_claims_on_coop_branch_id"
    t.index ["cooperative_id"], name: "index_process_claims_on_cooperative_id"
    t.index ["geo_barangay_id"], name: "index_process_claims_on_geo_barangay_id"
    t.index ["geo_municipality_id"], name: "index_process_claims_on_geo_municipality_id"
    t.index ["geo_province_id"], name: "index_process_claims_on_geo_province_id"
    t.index ["geo_region_id"], name: "index_process_claims_on_geo_region_id"
    t.index ["plan_id"], name: "index_process_claims_on_plan_id"
  end

  create_table "reconsiders", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "process_claim_id", null: false
    t.bigint "claim_route_id", null: false
    t.bigint "user_id", null: false
    t.string "status"
    t.decimal "amount", precision: 18, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["claim_route_id"], name: "index_reconsiders_on_claim_route_id"
    t.index ["process_claim_id"], name: "index_reconsiders_on_process_claim_id"
    t.index ["user_id"], name: "index_reconsiders_on_user_id"
  end

  create_table "requirements", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "user_name"
    t.bigint "branch_id"
    t.bigint "authority_level_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["authority_level_id"], name: "index_users_on_authority_level_id"
    t.index ["branch_id"], name: "index_users_on_branch_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "claim_benefits", "benefits"
  add_foreign_key "claim_benefits", "process_claims"
  add_foreign_key "claim_causes", "process_claims"
  add_foreign_key "claim_documents", "documents"
  add_foreign_key "claim_documents", "process_claims"
  add_foreign_key "claim_remarks", "process_claims"
  add_foreign_key "coop_branches", "cooperatives"
  add_foreign_key "geo_barangays", "geo_municipalities"
  add_foreign_key "geo_barangays", "geo_provinces"
  add_foreign_key "geo_barangays", "geo_regions"
  add_foreign_key "geo_municipalities", "geo_provinces"
  add_foreign_key "geo_municipalities", "geo_regions"
  add_foreign_key "geo_provinces", "geo_regions"
  add_foreign_key "reconsiders", "claim_routes"
  add_foreign_key "reconsiders", "process_claims"
  add_foreign_key "reconsiders", "users"
end
