class CreateTestsuites < ActiveRecord::Migration
  def self.up
    create_table :testsuites do |t|
      t.text :details
    end
  end

  def self.down
    drop_table :testsuites
  end
end
