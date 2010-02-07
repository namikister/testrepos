class CreateTestprojects < ActiveRecord::Migration
  def self.up
    create_table :testprojects do |t|
      t.text    :notes
      t.string  :color,             :limit => 12, :default => "#9BD", :null => false
      t.boolean :active,                          :default => true,   :null => false
      t.boolean :option_reqs,                     :default => false,  :null => false
      t.boolean :option_priority,                 :default => false,  :null => false
      t.boolean :option_automation,               :default => false,  :null => false
      t.string  :prefix,            :limit => 16, :default => "",     :null => false
      t.integer :tc_counter,                      :default => 0,      :null => false
      t.integer :is_public,         :limit => 1,  :default => 1,      :null => false
      t.timestamps
    end
    add_index :testprojects, [:id, :active], :name => "id_active"
    add_index :testprojects, [:prefix], :name => "prefix", :unique => true
  end

  def self.down
    remove_index :testprojects, :column => [:id, :active], :name => "id_active"
    remove_index :testprojects, :column => [:prefix], :name => "prefix", :unique => true
    drop_table :testprojects
  end
end
