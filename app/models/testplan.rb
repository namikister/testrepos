class Testplan < ActiveRecord::Base
  include Testrepos::Node
  has_one :node, :class_name => "NodeHierarchy", :foreign_key => "id"
  has_many :testplan_tcversion
  def name() self.node.name end
end
