class CreateTcversions < ActiveRecord::Migration
  def self.up
    create_table :tcversions do |t|
      t.integer  :tc_external_id
      t.integer  :version,          :limit => 2, :default => 1,    :null => false
      t.text     :summary
      t.text     :steps
      t.text     :expected_results
      t.integer  :importance,       :limit => 2, :default => 2,    :null => false
      t.integer  :author_id
      t.datetime :creation_ts,                                     :null => false
      t.integer  :updater_id
      t.datetime :modification_ts,                                 :null => false
      t.boolean  :active,                        :default => true, :null => false
      t.boolean  :is_open,                       :default => true, :null => false
      t.boolean  :execution_type,                :default => true, :null => false
      t.text     :preconditions
    end
  end

  def self.down
    drop_table :tcversions
  end
end
