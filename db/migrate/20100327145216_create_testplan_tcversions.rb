class CreateTestplanTcversions < ActiveRecord::Migration
  def self.up
    create_table :testplan_tcversions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :testplan_tcversions
  end
end
