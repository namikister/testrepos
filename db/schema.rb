# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "assignment_status", :force => true do |t|
    t.string "description", :limit => 100, :default => "unknown", :null => false
  end

  create_table "assignment_types", :force => true do |t|
    t.string "fk_table",    :limit => 30,  :default => ""
    t.string "description", :limit => 100, :default => "unknown", :null => false
  end

  create_table "attachments", :force => true do |t|
    t.integer  "fk_id",                                  :default => 0,  :null => false
    t.string   "fk_table",         :limit => 250,        :default => ""
    t.string   "title",            :limit => 250,        :default => ""
    t.string   "description",      :limit => 250,        :default => ""
    t.string   "file_name",        :limit => 250,        :default => "", :null => false
    t.string   "file_path",        :limit => 250,        :default => ""
    t.integer  "file_size",                              :default => 0,  :null => false
    t.string   "file_type",        :limit => 250,        :default => "", :null => false
    t.datetime "date_added",                                             :null => false
    t.binary   "content",          :limit => 2147483647
    t.integer  "compression_type",                       :default => 0,  :null => false
  end

  create_table "builds", :force => true do |t|
    t.integer   "testplan_id",                   :default => 0,           :null => false
    t.string    "name",           :limit => 100, :default => "undefined", :null => false
    t.text      "notes"
    t.boolean   "active",                        :default => true,        :null => false
    t.boolean   "is_open",                       :default => true,        :null => false
    t.timestamp "creation_ts",                                            :null => false
    t.date      "release_date"
    t.date      "closed_on_date"
  end

  add_index "builds", ["testplan_id", "name"], :name => "name", :unique => true
  add_index "builds", ["testplan_id"], :name => "testplan_id"

  create_table "cfield_design_values", :id => false, :force => true do |t|
    t.integer "field_id",                 :default => 0,  :null => false
    t.integer "node_id",                  :default => 0,  :null => false
    t.string  "value",    :limit => 4000, :default => "", :null => false
  end

  add_index "cfield_design_values", ["node_id"], :name => "idx_cfield_design_values"

  create_table "cfield_execution_values", :id => false, :force => true do |t|
    t.integer "field_id",                     :default => 0,  :null => false
    t.integer "execution_id",                 :default => 0,  :null => false
    t.integer "testplan_id",                  :default => 0,  :null => false
    t.integer "tcversion_id",                 :default => 0,  :null => false
    t.string  "value",        :limit => 4000, :default => "", :null => false
  end

  create_table "cfield_node_types", :id => false, :force => true do |t|
    t.integer "field_id",     :default => 0, :null => false
    t.integer "node_type_id", :default => 0, :null => false
  end

  add_index "cfield_node_types", ["node_type_id"], :name => "idx_custom_fields_assign"

  create_table "cfield_testplan_design_values", :id => false, :force => true do |t|
    t.integer "field_id",                 :default => 0,  :null => false
    t.integer "link_id",                  :default => 0,  :null => false
    t.string  "value",    :limit => 4000, :default => "", :null => false
  end

  add_index "cfield_testplan_design_values", ["link_id"], :name => "idx_cfield_tplan_design_val"

  create_table "cfield_testprojects", :id => false, :force => true do |t|
    t.integer "field_id",                           :default => 0,     :null => false
    t.integer "testproject_id",                     :default => 0,     :null => false
    t.integer "display_order",         :limit => 2, :default => 1,     :null => false
    t.boolean "active",                             :default => true,  :null => false
    t.boolean "required_on_design",                 :default => false, :null => false
    t.boolean "required_on_execution",              :default => false, :null => false
    t.integer "location",              :limit => 1, :default => 1,     :null => false
  end

  create_table "custom_fields", :force => true do |t|
    t.string  "name",                      :limit => 64,   :default => "", :null => false
    t.string  "label",                     :limit => 64,   :default => "", :null => false
    t.integer "type",                      :limit => 2,    :default => 0,  :null => false
    t.string  "possible_values",           :limit => 4000, :default => "", :null => false
    t.string  "default_value",             :limit => 4000, :default => "", :null => false
    t.string  "valid_regexp",                              :default => "", :null => false
    t.integer "length_min",                                :default => 0,  :null => false
    t.integer "length_max",                                :default => 0,  :null => false
    t.integer "show_on_design",            :limit => 1,    :default => 1,  :null => false
    t.integer "enable_on_design",          :limit => 1,    :default => 1,  :null => false
    t.integer "show_on_execution",         :limit => 1,    :default => 0,  :null => false
    t.integer "enable_on_execution",       :limit => 1,    :default => 0,  :null => false
    t.integer "show_on_testplan_design",   :limit => 1,    :default => 0,  :null => false
    t.integer "enable_on_testplan_design", :limit => 1,    :default => 0,  :null => false
  end

  add_index "custom_fields", ["name"], :name => "idx_custom_fields_name", :unique => true

  create_table "db_version", :id => false, :force => true do |t|
    t.string   "version",    :limit => 50, :default => "unknown", :null => false
    t.datetime "upgrade_ts",                                      :null => false
    t.text     "notes"
  end

  create_table "events", :force => true do |t|
    t.integer "transaction_id",               :default => 0, :null => false
    t.integer "log_level",      :limit => 2,  :default => 0, :null => false
    t.string  "source",         :limit => 45
    t.text    "description",                                 :null => false
    t.integer "fired_at",                     :default => 0, :null => false
    t.string  "activity",       :limit => 45
    t.integer "object_id"
    t.string  "object_type",    :limit => 45
  end

  add_index "events", ["fired_at"], :name => "fired_at"
  add_index "events", ["transaction_id"], :name => "transaction_id"

  create_table "execution_bugs", :id => false, :force => true do |t|
    t.integer "execution_id",               :default => 0,   :null => false
    t.string  "bug_id",       :limit => 16, :default => "0", :null => false
  end

  create_table "executions", :force => true do |t|
    t.integer  "build_id",                      :default => 0,    :null => false
    t.integer  "tester_id"
    t.datetime "execution_ts"
    t.string   "status",           :limit => 1
    t.integer  "testplan_id",                   :default => 0,    :null => false
    t.integer  "tcversion_id",                  :default => 0,    :null => false
    t.integer  "tcversion_number", :limit => 2, :default => 1,    :null => false
    t.boolean  "execution_type",                :default => true, :null => false
    t.text     "notes"
    t.integer  "platform_id",                   :default => 0,    :null => false
  end

  add_index "executions", ["execution_type"], :name => "execution_type"
  add_index "executions", ["testplan_id", "tcversion_id"], :name => "testplan_id_tcversion_id"

  create_table "keywords", :force => true do |t|
    t.string  "keyword",        :limit => 100, :default => "", :null => false
    t.integer "testproject_id",                :default => 0,  :null => false
    t.text    "notes"
  end

  add_index "keywords", ["keyword"], :name => "keyword"
  add_index "keywords", ["testproject_id"], :name => "testproject_id"

  create_table "milestones", :force => true do |t|
    t.integer "testplan_id",                :default => 0,           :null => false
    t.date    "target_date",                                         :null => false
    t.integer "a",           :limit => 1,   :default => 0,           :null => false
    t.integer "b",           :limit => 1,   :default => 0,           :null => false
    t.integer "c",           :limit => 1,   :default => 0,           :null => false
    t.string  "name",        :limit => 100, :default => "undefined", :null => false
    t.date    "start_date",                                          :null => false
  end

  add_index "milestones", ["name", "testplan_id"], :name => "name_testplan_id", :unique => true
  add_index "milestones", ["testplan_id"], :name => "testplan_id"

  create_table "node_types", :force => true do |t|
    t.string "description", :limit => 100, :default => "testproject", :null => false
  end

  create_table "nodes_hierarchy", :force => true do |t|
    t.string  "name",         :limit => 100
    t.integer "parent_id"
    t.integer "node_type_id",                :default => 1, :null => false
    t.integer "node_order"
  end

  add_index "nodes_hierarchy", ["parent_id", "node_order"], :name => "pid_m_nodeorder"

  create_table "object_keywords", :force => true do |t|
    t.integer "fk_id",                    :default => 0,  :null => false
    t.string  "fk_table",   :limit => 30, :default => ""
    t.integer "keyword_id",               :default => 0,  :null => false
  end

  create_table "platforms", :force => true do |t|
    t.string  "name",           :limit => 100, :default => "", :null => false
    t.integer "testproject_id",                                :null => false
    t.text    "notes",                                         :null => false
  end

  add_index "platforms", ["testproject_id", "name"], :name => "idx_platforms", :unique => true

  create_table "req_coverage", :id => false, :force => true do |t|
    t.integer "req_id",      :null => false
    t.integer "testcase_id", :null => false
  end

  add_index "req_coverage", ["req_id", "testcase_id"], :name => "req_testcase"

  create_table "req_specs", :force => true do |t|
    t.integer  "testproject_id",                                  :null => false
    t.string   "title",           :limit => 100, :default => "",  :null => false
    t.text     "scope"
    t.integer  "total_req",                      :default => 0,   :null => false
    t.string   "type",            :limit => 1,   :default => "n"
    t.integer  "author_id"
    t.datetime "creation_ts",                                     :null => false
    t.integer  "modifier_id"
    t.datetime "modification_ts",                                 :null => false
  end

  add_index "req_specs", ["testproject_id"], :name => "testproject_id"

  create_table "requirements", :force => true do |t|
    t.integer  "srs_id",                                          :null => false
    t.string   "req_doc_id",      :limit => 32
    t.string   "title",           :limit => 100, :default => "",  :null => false
    t.text     "scope"
    t.string   "status",          :limit => 1,   :default => "V", :null => false
    t.string   "type",            :limit => 1
    t.integer  "author_id"
    t.datetime "creation_ts",                                     :null => false
    t.integer  "modifier_id"
    t.datetime "modification_ts",                                 :null => false
  end

  add_index "requirements", ["srs_id", "req_doc_id"], :name => "req_doc_id", :unique => true
  add_index "requirements", ["srs_id", "status"], :name => "srs_id"

  create_table "rights", :force => true do |t|
    t.string "description", :limit => 100, :default => "", :null => false
  end

  add_index "rights", ["description"], :name => "rights_descr", :unique => true

  create_table "risk_assignments", :force => true do |t|
    t.integer "testplan_id",              :default => 0,   :null => false
    t.integer "node_id",                  :default => 0,   :null => false
    t.string  "risk",        :limit => 1, :default => "2", :null => false
    t.string  "importance",  :limit => 1, :default => "M", :null => false
  end

  add_index "risk_assignments", ["testplan_id", "node_id"], :name => "tp_node_id", :unique => true

  create_table "role_rights", :id => false, :force => true do |t|
    t.integer "role_id",  :default => 0, :null => false
    t.integer "right_id", :default => 0, :null => false
  end

  create_table "roles", :force => true do |t|
    t.string "description", :limit => 100, :default => "", :null => false
    t.text   "notes"
  end

  add_index "roles", ["description"], :name => "roles_descr", :unique => true

  create_table "tcversions", :force => true do |t|
    t.integer  "tc_external_id"
    t.integer  "version",          :limit => 2, :default => 1,    :null => false
    t.text     "summary"
    t.text     "steps"
    t.text     "expected_results"
    t.integer  "importance",       :limit => 2, :default => 2,    :null => false
    t.integer  "author_id"
    t.datetime "creation_ts",                                     :null => false
    t.integer  "updater_id"
    t.datetime "modification_ts",                                 :null => false
    t.boolean  "active",                        :default => true, :null => false
    t.boolean  "is_open",                       :default => true, :null => false
    t.boolean  "execution_type",                :default => true, :null => false
    t.text     "preconditions"
  end

  create_table "testcase_keywords", :id => false, :force => true do |t|
    t.integer "testcase_id", :default => 0, :null => false
    t.integer "keyword_id",  :default => 0, :null => false
  end

  create_table "testplan_platforms", :force => true do |t|
    t.integer "testplan_id", :null => false
    t.integer "platform_id", :null => false
  end

  add_index "testplan_platforms", ["testplan_id", "platform_id"], :name => "idx_testplan_platforms", :unique => true

  create_table "testplan_tcversions", :force => true do |t|
    t.integer   "testplan_id",               :default => 0, :null => false
    t.integer   "tcversion_id",              :default => 0, :null => false
    t.integer   "node_order",                :default => 1, :null => false
    t.integer   "urgency",      :limit => 2, :default => 2, :null => false
    t.integer   "author_id"
    t.timestamp "creation_ts",                              :null => false
    t.integer   "platform_id",               :default => 0, :null => false
  end

  add_index "testplan_tcversions", ["testplan_id", "tcversion_id", "platform_id"], :name => "testplan_tcversions_tplan_tcversion", :unique => true

  create_table "testplans", :force => true do |t|
    t.integer "testproject_id",              :default => 0,    :null => false
    t.text    "notes"
    t.boolean "active",                      :default => true, :null => false
    t.boolean "is_open",                     :default => true, :null => false
    t.integer "is_public",      :limit => 1, :default => 1,    :null => false
  end

  add_index "testplans", ["testproject_id", "active"], :name => "testproject_id_active"

  create_table "testprojects", :force => true do |t|
    t.text    "notes"
    t.string  "color",             :limit => 12, :default => "#9BD", :null => false
    t.boolean "active",                          :default => true,   :null => false
    t.boolean "option_reqs",                     :default => false,  :null => false
    t.boolean "option_priority",                 :default => false,  :null => false
    t.boolean "option_automation",               :default => false,  :null => false
    t.string  "prefix",            :limit => 16, :default => "",     :null => false
    t.integer "tc_counter",                      :default => 0,      :null => false
    t.integer "is_public",         :limit => 1,  :default => 1,      :null => false
  end

  add_index "testprojects", ["id", "active"], :name => "id_active"
  add_index "testprojects", ["prefix"], :name => "prefix", :unique => true

  create_table "testsuites", :force => true do |t|
    t.text "details"
  end

  create_table "text_templates", :force => true do |t|
    t.integer  "type",          :limit => 2,                      :null => false
    t.string   "title",         :limit => 100, :default => "",    :null => false
    t.text     "template_data"
    t.integer  "author_id"
    t.datetime "creation_ts",                                     :null => false
    t.boolean  "is_public",                    :default => false, :null => false
  end

  add_index "text_templates", ["type", "title"], :name => "idx_text_templates", :unique => true

  create_table "transactions", :force => true do |t|
    t.string  "entry_point", :limit => 45, :default => "", :null => false
    t.integer "start_time",                :default => 0,  :null => false
    t.integer "end_time",                  :default => 0,  :null => false
    t.integer "user_id",                   :default => 0,  :null => false
    t.string  "session_id",  :limit => 45
  end

  create_table "user_assignments", :force => true do |t|
    t.integer  "type",        :default => 1, :null => false
    t.integer  "feature_id",  :default => 0, :null => false
    t.integer  "user_id",     :default => 0
    t.datetime "deadline_ts"
    t.integer  "assigner_id", :default => 0
    t.datetime "creation_ts",                :null => false
    t.integer  "status",      :default => 1
  end

  add_index "user_assignments", ["feature_id"], :name => "feature_id"

  create_table "user_group", :force => true do |t|
    t.string "title",       :limit => 100, :default => "", :null => false
    t.text   "description"
  end

  add_index "user_group", ["title"], :name => "title", :unique => true

  create_table "user_group_assign", :id => false, :force => true do |t|
    t.integer "usergroup_id", :null => false
    t.integer "user_id",      :null => false
  end

  add_index "user_group_assign", ["usergroup_id", "user_id"], :name => "idx_user_group_assign", :unique => true

  create_table "user_testplan_roles", :id => false, :force => true do |t|
    t.integer "user_id",     :default => 0, :null => false
    t.integer "testplan_id", :default => 0, :null => false
    t.integer "role_id",     :default => 0, :null => false
  end

  create_table "user_testproject_roles", :id => false, :force => true do |t|
    t.integer "user_id",        :default => 0, :null => false
    t.integer "testproject_id", :default => 0, :null => false
    t.integer "role_id",        :default => 0, :null => false
  end

  create_table "users", :force => true do |t|
    t.string  "login",                  :limit => 30,  :default => "",      :null => false
    t.string  "password",               :limit => 32,  :default => "",      :null => false
    t.integer "role_id",                               :default => 0,       :null => false
    t.string  "email",                  :limit => 100, :default => "",      :null => false
    t.string  "first",                  :limit => 30,  :default => "",      :null => false
    t.string  "last",                   :limit => 30,  :default => "",      :null => false
    t.string  "locale",                 :limit => 10,  :default => "en_GB", :null => false
    t.integer "default_testproject_id"
    t.boolean "active",                                :default => true,    :null => false
    t.string  "script_key",             :limit => 32
  end

  add_index "users", ["login"], :name => "login", :unique => true

end
