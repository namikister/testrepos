class TestprojectsController < ApplicationController
  menu_item :projects, :only => :index
  menu_item :overview, :only => :show
  # GET /testprojects
  # GET /testprojects.xml
  def index
    @testprojects = Testproject.find(:all, :conditions => "id > 0")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @testprojects }
    end
  end

  # GET /testprojects/1
  # GET /testprojects/1.xml
  def show
    @testproject = Testproject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @testproject }
    end
  end

  # GET /testprojects/new
  # GET /testprojects/new.xml
  def new
    @testproject = Testproject.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @testproject }
    end
  end

  # GET /testprojects/1/edit
  def edit
    @testproject = Testproject.find(params[:id])
  end

  # POST /testprojects
  # POST /testprojects.xml
  def create
    @testproject = Testproject.new(params[:testproject])

    respond_to do |format|
      if @testproject.save
        flash[:notice] = 'Testproject was successfully created.'
        format.html { redirect_to(@testproject) }
        format.xml  { render :xml => @testproject, :status => :created, :location => @testproject }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @testproject.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /testprojects/1
  # PUT /testprojects/1.xml
  def update
    @testproject = Testproject.find(params[:id])

    respond_to do |format|
      if @testproject.update_attributes(params[:testproject])
        flash[:notice] = 'Testproject was successfully updated.'
        format.html { redirect_to(@testproject) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @testproject.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /testprojects/1
  # DELETE /testprojects/1.xml
  def destroy
    @testproject = Testproject.find(params[:id])
    @testproject.destroy

    respond_to do |format|
      format.html { redirect_to(testprojects_url) }
      format.xml  { head :ok }
    end
  end
end
