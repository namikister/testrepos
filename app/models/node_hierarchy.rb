class NodeHierarchy < ActiveRecord::Base
  NODE_TYPES = ["", "Testproject", "Testsuite", "Testcase", "Tcversion", "Testplan", "RequirementSpec", "Requirement"]
  # belongs_to :node,
  #            :foreign_key  => "id",
  #            :foreign_type => "node_type_id",
  #            :polymorphic  => true
  acts_as_tree :order => "node_order"

  def type
    NODE_TYPES[self.node_type_id]
  end
  def instance
    type.constantize.find(self.id)
  end
end
