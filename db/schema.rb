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

ActiveRecord::Schema.define(version: 2019_08_05_195658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "armor_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "char_configs", force: :cascade do |t|
    t.integer "statlinemax"
    t.integer "elementdoublepct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "useelementmath"
  end

  create_table "element_upgrades", force: :cascade do |t|
    t.string "combohash"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elements", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "modifiers", force: :cascade do |t|
    t.string "name"
    t.boolean "replacewithshape"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offense_types", force: :cascade do |t|
    t.string "name"
    t.integer "numberofweapons"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resource_loadout_combos", force: :cascade do |t|
    t.integer "resource_id"
    t.integer "offense_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offense_type_id"], name: "index_resource_loadout_combos_on_offense_type_id"
    t.index ["resource_id"], name: "index_resource_loadout_combos_on_resource_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.integer "baseval"
    t.boolean "addstatline"
    t.boolean "subtractstatline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "generatespell"
    t.integer "minval"
    t.integer "maxval"
  end

  create_table "shapes", force: :cascade do |t|
    t.string "name"
    t.integer "ordering"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "afterelement"
  end

  create_table "stats", force: :cascade do |t|
    t.string "name"
    t.integer "minval"
    t.integer "maxval"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "shortname"
  end

  create_table "weapon_offense_type_combos", force: :cascade do |t|
    t.boolean "alwayspick"
    t.integer "weapon_id"
    t.integer "offense_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offense_type_id"], name: "index_weapon_offense_type_combos_on_offensetype_id"
    t.index ["weapon_id"], name: "index_weapon_offense_type_combos_on_weapon_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
