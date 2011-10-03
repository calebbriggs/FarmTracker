class FarmsController < ApplicationController
  # GET /farms
  # GET /farms.json
  def index
    @farms = Farm.where(:user_id => @logged_user.id)
    total_acres = 0
    @farms.each {|farm| total_acres += farm.acres.to_i}
    @total_acres = total_acres

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @farms }
    end
  end

  # GET /farms/1
  # GET /farms/1.json
  def show
    @farm = Farm.find(params[:id])
    @herds = Herd.where(:farm_id => @farm.id)
    respond_to do |format|
      format.html # index.html.erbb
      format.json { render :json => @farm }
    end
  end

  # GET /farms/new
  # GET /farms/new.json
  def new
    @farm = Farm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @farm }
    end
  end

  # GET /farms/1/edit
  def edit
    @farm = Farm.find(params[:id])
  end

  # POST /farms
  # POST /farms.json
  def create
    @farm = Farm.new(params[:farm])
    @farm.user = @logged_user;
    respond_to do |format|
      if @farm.save
        format.html { redirect_to @farm, :notice => 'Farm was successfully created.' }
        format.json { render :json => @farm, :status => :created, :location => @farm }
      else
        format.html { render :action => "new" }
        format.json { render :json => @farm.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /farms/1
  # PUT /farms/1.json
  def update
    @farm = Farm.find(params[:id])
    @farm.user = @logged_user;
    respond_to do |format|
      if @farm.update_attributes(params[:farm])
        format.html { redirect_to @farm, :notice => 'Farm was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @farm.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /farms/1
  # DELETE /farms/1.json
  def destroy
    @farm = Farm.find(params[:id])
    @farm.destroy

    respond_to do |format|
      format.html { redirect_to farms_url }
      format.json { head :ok }
    end
  end


end
