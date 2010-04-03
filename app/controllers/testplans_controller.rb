class TestplansController < ApplicationController
  menu_item :testplan, :only => :show
  before_filter :find_testproject

  # GET /testprojects/:project_id/testplans
  def index
    @testplans = Testplan.find(:all, :conditions => "id = #{@testproject.id}")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @testplans }
    end
  end

  # GET /testprojects/:project_id/testplans/1
  def show
    @testplan = Testplan.find(params[:plan_id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @testplan }
    end
  end

  # GET /testprojects/:project_id/testplans/1/children
  def children
#    types = params[:require].map{|a| NodeHierarchy::NODE_TYPES.index(a)}
    @children = TestplanTcversion.find(:all, :conditions => "testplan_id = #{params[:plan_id]}").map{|a| a.tcversion.node.parent}
    respond_to do |format|
      format.json  { render :layout => false,
                            :json => @children.map{|node| node.instance.contents(:steps, :expected_results)} }
    end
  end

private
  def find_testproject
    @testproject = Testproject.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

end
