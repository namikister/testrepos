class CreateNodeHierarchies < ActiveRecord::Migration
  def self.up
    create_table :nodes_hierarchy do |t|
      t.string  :name,         :limit => 100
      t.integer :parent_id
      t.integer :node_type_id,                :default => 1, :null => false
      t.integer :node_order
    end
    add_index :nodes_hierarchy, [:parent_id, :node_order], :name => "pid_m_nodeorder"
  end

  def self.down
    remove_index :nodes_hierarchy, :column => [:parent_id, :node_order], :name => 'pid_m_nodeorder'
    drop_table :nodes_hierarchy
  end
end
