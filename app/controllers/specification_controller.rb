class SpecificationController < ApplicationController
  menu_item :specification, :only => :show

  def show
    @testproject = Testproject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @testproject }
    end
  end
end
