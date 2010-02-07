class Testsuite < ActiveRecord::Base
  include Testrepos::Node
  has_one :node, :class_name => "NodeHierarchy", :foreign_key => "id"
  alias_attribute :notes, :details
  def name() self.node.name end
end
