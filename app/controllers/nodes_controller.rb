class NodesController < ApplicationController
  # GET /nodes/1/children
  def children
    types = params[:require].map{|a| NodeHierarchy::NODE_TYPES.index(a)}
    @children = NodeHierarchy.find(params[:id]).children.find_all_by_node_type_id(types)
    respond_to do |format|
      format.json  { render :layout => false,
                            :json => @children.map{|node| node.instance.contents(:steps, :expected_results)} }
    end
  end
end
