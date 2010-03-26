class SpecificationController < ApplicationController
  menu_item :specification, :only => :show
  before_filter :find_testproject

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @testproject }
    end
  end

private
  def find_testproject
    @testproject = Testproject.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
