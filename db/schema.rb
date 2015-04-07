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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150406220014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "credentials_jobs", id: false, force: :cascade do |t|
    t.integer "credential_id", null: false
    t.integer "job_id",        null: false
  end

  add_index "credentials_jobs", ["credential_id", "job_id"], name: "index_credentials_jobs_on_credential_id_and_job_id", using: :btree
  add_index "credentials_jobs", ["job_id", "credential_id"], name: "index_credentials_jobs_on_job_id_and_credential_id", using: :btree

  create_table "hosts", force: :cascade do |t|
    t.string   "ipaddress"
    t.string   "hostname"
    t.string   "macaddress"
    t.string   "responsetime"
    t.string   "ports"
    t.string   "logged"
    t.string   "langroup"
    t.string   "os"
    t.string   "tod"
    t.string   "users"
    t.string   "windowsname"
    t.string   "computermodel"
    t.string   "status"
    t.string   "bruteprogress"
    t.integer  "credential_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "hosts_jobs", id: false, force: :cascade do |t|
    t.integer "host_id", null: false
    t.integer "job_id",  null: false
  end

  add_index "hosts_jobs", ["host_id", "job_id"], name: "index_hosts_jobs_on_host_id_and_job_id", using: :btree
  add_index "hosts_jobs", ["job_id", "host_id"], name: "index_hosts_jobs_on_job_id_and_host_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "name",          null: false
    t.text     "description"
    t.text     "error_message"
    t.string   "status",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
