class CreateTestplans < ActiveRecord::Migration
  def self.up
    create_table :testplans do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :testplans
  end
end
