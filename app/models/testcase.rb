class Testcase
  include Testrepos::Node
  attr_accessor :id
  def initialize(id)
    @id = id
  end
  def Testcase.find(id)
    Testcase.new(id)
  end
  def node() NodeHierarchy.find(id) end
  def name()  node.name end
  def versions
    @versions ||= node.children.map(&:instance)
  end
  def newest_version()
    @newest_version ||= versions.max{|a, b| a.version <=> b.version}
  end
  def summary() newest_version.summary end
  def steps() newest_version.steps end
  def expected_results() newest_version.expected_results end
  alias_method :notes, :summary
end
