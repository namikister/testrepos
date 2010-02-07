class Tcversion < ActiveRecord::Base
  include Testrepos::Node
  has_one :node, :class_name => "NodeHierarchy", :foreign_key => "id"
  def name() self.node.name end
  alias_attribute :notes, :summary
end
