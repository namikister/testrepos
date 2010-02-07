class Testproject < ActiveRecord::Base
  include Testrepos::Node
  has_one :node, :class_name => "NodeHierarchy", :foreign_key => "id"
  def name() self.node.name end
  # def to_json(*args)
  #   new_args = { :methods => [:name], :except => :node }
  #   new_args.each do |key, val|
  #     unless args.first[key]
  #       args.first[key] = val
  #     else
  #       if args.first[key].kind_of? Array
  #         args.first[key] += val
  #       else
  #         args.first[key] = val << args.first[key]
  #       end
  #     end
  #   end
  #   original_to_json(*args)
  # end
end
