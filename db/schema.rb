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

ActiveRecord::Schema.define(version: 20_160_518_192_334) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'aggregates', force: :cascade do |t|
    t.integer  'device_id'
    t.date     'date'
    t.float    'energy'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'categories', force: :cascade do |t|
    t.string   'name',       null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'devices', force: :cascade do |t|
    t.integer  'user_id'
    t.string   'bt_mac_address'
    t.string   'category_id'
    t.string   'name'
    t.float    'power'
    t.boolean  'validity'
    t.datetime 'created_at',                     null: false
    t.datetime 'updated_at',                     null: false
    t.boolean  'active', default: false, null: false
  end

  create_table 'devices_time_gaps', force: :cascade do |t|
    t.integer  'device_id'
    t.integer  'time_gap_id'
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
    t.index %w(device_id time_gap_id), name: 'index_devices_time_gaps_on_device_id_and_time_gap_id', using: :btree
  end

  create_table 'time_gaps', force: :cascade do |t|
    t.time     'start'
    t.time     'end'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string   'email',                  default: '',       null: false
    t.string   'encrypted_password',     default: '',       null: false
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer  'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet     'current_sign_in_ip'
    t.inet     'last_sign_in_ip'
    t.datetime 'created_at',                                null: false
    t.datetime 'updated_at',                                null: false
    t.string   'name'
    t.string   'role', default: 'client'
    t.index ['email'], name: 'index_users_on_email', unique: true, using: :btree
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true, using: :btree
  end
end
